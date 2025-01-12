
import 'package:dartz/dartz.dart';
import 'package:kiosk_finder/core/error/failure.dart';
import 'package:kiosk_finder/feature/authentication/data/models/auth_response.dart';

abstract class AuthServiceRepository {
  Future<Either<Failure, AuthResponse>> registerUser(Map<String, dynamic> userData);
  Future<Either<Failure, AuthResponse>> loginUser(Map<String, dynamic> userData);
}
