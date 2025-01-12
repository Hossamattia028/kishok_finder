
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_finder/feature/authentication/data/models/auth_response.dart';
import 'package:kiosk_finder/feature/authentication/domain/use_cases/login_user_usecase.dart';
import 'package:kiosk_finder/feature/authentication/presentation/bloc/auth_event.dart';
import 'package:kiosk_finder/feature/authentication/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  bool showPassword = false;
  String resMsg = "";
  static AuthBloc get(BuildContext context) => BlocProvider.of(context);

  LoginUserServiceUseCase loginUserServiceUseCase;
  RegisterUserServiceUseCase registerUserServiceUseCase;
  AuthBloc({
    required this.loginUserServiceUseCase,
    required this.registerUserServiceUseCase,
}) : super(AuthInitialState()) {
    on<RegisterEvent>((RegisterEvent event, emit) async{
      await register(event, emit);
    });

    on<LogInEvent>((event, emit) async{
      await logIn(event,emit );
    });

    on<LogOutEvent>((event, emit) async{
      await logOut(event,emit );
    });

  }


  logIn(LogInEvent event,emit)async{
    emit(const LogInLoadingState());
    try{
      var res = await loginUserServiceUseCase(data: event.user);
      res.fold((l) {
        resMsg = l.toString();
      },(data) {
        resMsg = data.msg.toString();
        if(data.isSuccess!=true){
          emit(LogInFailedState(response: AuthResponse(msg: resMsg,isFailed: true)));
        }else{
          emit(LogInSuccessfullyState(response: AuthResponse(msg: resMsg,isSuccess: true)));
        }
      });
    }catch(e){
      debugPrint("logInError: $e");
      emit(LogInFailedState(response: AuthResponse(msg: resMsg,isFailed: true)));
    }
  }

  register(RegisterEvent event,emit)async{
    emit(const RegisterLoadingState());
    try{
      var res = await registerUserServiceUseCase(data: event.user);
      res.fold((l) {
        resMsg = l.toString();
      },(data) {
        resMsg = data.msg.toString();
        if(data.isSuccess!=true){
          emit(RegisterFailedState(response: AuthResponse(msg: resMsg,isFailed: true)));
        }else{
          emit(RegisterSuccessfullyState(response: AuthResponse(msg: resMsg,isSuccess: true)));
        }
      });
    }catch(e){
      debugPrint("RegisterError: $e");
      emit(RegisterFailedState(response: AuthResponse(msg: resMsg,isFailed: true)));
    }
  }

  logOut(event,emit) async {
    emit(const LogOutLoadingState());
    await FirebaseAuth.instance.signOut();
    emit(const LogOutState());
  }

}