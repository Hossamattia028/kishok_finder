import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:kiosk_finder/core/network/network.dart';
import 'package:kiosk_finder/feature/authentication/data/data_sources/authentication_data_source.dart';
import 'package:kiosk_finder/feature/authentication/data/repositories/auth_service_model_repository.dart';
import 'package:kiosk_finder/feature/authentication/domain/use_cases/login_user_usecase.dart';
import 'package:kiosk_finder/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kiosk_finder/feature/home/data/data_sources/home_data_source.dart';
import 'package:kiosk_finder/feature/home/data/repositories/home_model_repository.dart';
import 'package:kiosk_finder/feature/home/domain/repositories/home_repository.dart';
import 'package:kiosk_finder/feature/home/domain/use_cases/home_usecase.dart';
import 'package:kiosk_finder/feature/home/presentation/bloc/home_bloc.dart';

import 'feature/authentication/domain/repositories/auth_service_repository.dart';

part "injection_container.dart";


