
import 'package:flutter/material.dart';
import 'package:kiosk_finder/feature/authentication/data/models/auth_response.dart';

@immutable
abstract class AuthState{
  const AuthState();
}

class AuthInitialState extends AuthState {}



class LogInSuccessfullyState extends AuthState{
  final AuthResponse response;
  const LogInSuccessfullyState({required this.response});
}
class LogInFailedState extends AuthState{
  final AuthResponse response;
  const LogInFailedState({required this.response});
}

class LogInLoadingState extends AuthState{
  const LogInLoadingState();
}


class LogOutLoadingState extends AuthState{
  const LogOutLoadingState();
}

class LogOutState extends AuthState{
  const LogOutState();
}

class RegisterSuccessfullyState extends AuthState{
  final AuthResponse response;
  const RegisterSuccessfullyState({required this.response});
}

class RegisterFailedState extends AuthState{
  final AuthResponse response;
  const RegisterFailedState({required this.response});
}

class RegisterLoadingState extends AuthState{
  const RegisterLoadingState();
}
