
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_finder/feature/home/domain/entities/kiosk_entity.dart';
import 'package:kiosk_finder/feature/home/domain/use_cases/home_usecase.dart';
import 'package:kiosk_finder/feature/home/presentation/bloc/home_event.dart';
import 'package:kiosk_finder/feature/home/presentation/bloc/home_state.dart';


class HomeBloc extends Bloc<HomeEvent,HomeState>{
  bool showPassword = false;
  String resMsg = "";
  static HomeBloc get(BuildContext context) => BlocProvider.of(context);

  HomeUseCase homeUseCase;

  HomeBloc({
    required this.homeUseCase,
}) : super(HomeInitState()) {

    on<FetchKiosks>((FetchKiosks event, emit) async{
      await fetchList(emit, event);
    });

  }

  List<KioskEntity> kioskList = [];
  String selectedCity = 'giza';
  fetchList(emit,FetchKiosks event)async{
    emit(const KioskState(isLoading: true));
    try{
      selectedCity = event.city;
      var res = await homeUseCase(data: {'city':event.city});
      res.fold((l) {
        resMsg = l.toString();
        emit(const KioskState(isLoading: false,error: 'error occurred '));
      },(data) {
        if(data.isNotEmpty){
          kioskList = data; 
          emit(const KioskState(isLoading: false,));
        }else{
          emit(const KioskState(isLoading: false,error: 'list not fetched'));
        }
      });
    }catch(e){
      debugPrint("fetchListError: $e");
      emit(const KioskState(isLoading: false,error: 'list not fetched'));
    }
  }


}