// ignore_for_file: use_build_context_synchronously

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_finder/core/styles/app_style.dart';
import 'package:kiosk_finder/core/styles/my_colors.dart';
import 'package:kiosk_finder/core/utils/small_fun.dart';
import 'package:kiosk_finder/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kiosk_finder/feature/authentication/presentation/bloc/auth_event.dart';
import 'package:kiosk_finder/feature/authentication/presentation/bloc/auth_state.dart';
import 'package:kiosk_finder/feature/authentication/presentation/widgets/not_have_an_account.dart';
import 'package:kiosk_finder/feature/home/presentation/screens/home_screen.dart';
import 'package:kiosk_finder/feature/shared_widgets/custom_button.dart';
import 'package:kiosk_finder/feature/shared_widgets/custom_text.dart';
import 'package:kiosk_finder/feature/shared_widgets/custom_text_form_field.dart';
import 'package:kiosk_finder/feature/shared_widgets/snackbars_builder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static final TextEditingController emailTextEditingController = TextEditingController();
  static final TextEditingController passTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: BlocListener<AuthBloc,AuthState>(
        listenWhen: (context,state)=> state is LogInSuccessfullyState || state is LogInFailedState ,
        listener: (ctx,state){
          var bloc = AuthBloc.get(ctx);
          if(state is LogInSuccessfullyState && state.response.isSuccess==true){
              passTextEditingController.text = "";
              SnackBarBuilder.showFeedBackMessage(context, bloc.resMsg, Colors.green);
              Util.pushPageAndRemoveRoutes(const HomeScreen(), context);
            }else{
              SnackBarBuilder.showFeedBackMessage(context, bloc.resMsg, Colors.red);
            }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 40,horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            FlutterLogo(size: 100.w,),
            const SizedBox(height: 30,),
            CustomTextFromField(
                height: 60,
                hintText: "Your email",
                radius: 10,
                textEditingController: emailTextEditingController,
                validator: () {},
                hintColor: kTextGrey,
                textInputType: TextInputType.emailAddress,
                textAlign: TextAlign.left,
                prefixIcon: null,
                cursorColor: kPrimary,
                suffixIcon: null,
                obscureText: false,
                isLabelError: false,
                hasBorder: true,
                borderWidth: 1,
                borderColor: kBlack2,
                labelText: '',
              ),
              CustomTextFromField(
                height: 60,
                hintText: "Your password",
                radius: 10,
                textEditingController: passTextEditingController,
                validator: () {},
                hintColor: kTextGrey,
                textInputType: TextInputType.visiblePassword,
                textAlign: TextAlign.left,
                prefixIcon: null,
                cursorColor: kPrimary,
                suffixIcon: null,
                obscureText: false,
                isLabelError: false,
                hasBorder: true,
                borderWidth: 1,
                borderColor: kBlack2,
                labelText: '',
              ),
              
                
              SizedBox(height: 25.w,),
              
              BlocBuilder<AuthBloc,AuthState>(
                builder: (ctx,state){
                  var bloc = AuthBloc.get(ctx);
                  if(state is LogInLoadingState)return const CircularProgressIndicator(backgroundColor: kPrimary,);
                  return CustomButton(
                      height: 52.h,
                      width: double.infinity,
                      widget: CustomText(
                        text: "LOGIN",
                        color: Colors.white,
                        fontSize: AppStyle.average.sp-1,
                        fontWeight: FontWeight.bold,
                        alignCenter: true,
                      ),
                      color: kPrimary,
                      onPressed: ()async{
                        String email = emailTextEditingController.text.trim();
                        String pass = passTextEditingController.text.trim();
                        if(email.isEmpty||pass.isEmpty){
                          SnackBarBuilder.showFeedBackMessage(context, 'Please insert all fields', Colors.red);
                          return;
                        }
        
                       
                        bloc.add(LogInEvent(user: {'email':email,'pass':pass}));
                        
                      },
                  );
                },
              ),
              
              const SizedBox(height: 20,),
              const NotHaveAnAccountWidget(),
              const SizedBox(height: 10,),
            ],
          ),
        )
      ),
    );
  }
}
