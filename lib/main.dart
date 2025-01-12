import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_finder/core/utils/small_fun.dart';
import 'package:kiosk_finder/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kiosk_finder/feature/authentication/presentation/screens/login.dart';
import 'package:kiosk_finder/feature/home/presentation/bloc/home_bloc.dart';
import 'package:kiosk_finder/feature/home/presentation/bloc/home_event.dart';
import 'package:kiosk_finder/feature/home/presentation/screens/home_screen.dart';
import 'package:kiosk_finder/feature/shared_widgets/error_widget.dart';
import 'injection_container_import.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  // debugPrint = (String? message, {int? wrapWidth}) {};
  // await Future.wait([]);
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context,widget)  => MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => di.sl<HomeBloc>()..add(const FetchKiosks('giza'))),
          BlocProvider(create: (ctx) => di.sl<AuthBloc>()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (BuildContext? context, Widget? widget) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return CustomError(errorDetails: errorDetails);
              };
              return widget!;
            },
            title: 'Kiosk Finder',
            home: Util.checkUser()?  const HomeScreen(): const LoginScreen(),
          ),
        ),
    );
  }
}