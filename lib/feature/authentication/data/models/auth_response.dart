


import 'package:kiosk_finder/feature/authentication/domain/entities/user_entity.dart';

class AuthResponse{
  String? msg;
  bool? isFailed;
  bool? isSuccess;
  bool? isLoad;
  UserService? user;
  AuthResponse({this.msg, this.isLoad,this.isSuccess,this.isFailed,this.user});
}


