import 'package:dartz/dartz.dart';
import 'package:kiosk_finder/core/error/failure.dart';
import 'package:kiosk_finder/feature/authentication/data/models/auth_response.dart';
import 'package:kiosk_finder/feature/authentication/domain/repositories/auth_service_repository.dart';

class LoginUserServiceUseCase {
  final AuthServiceRepository authServiceRepository;

  LoginUserServiceUseCase({
    required this.authServiceRepository,
  });

  Future<Either<Failure, AuthResponse>> call(
      {required Map<String,dynamic> data}) async {
    return await authServiceRepository.loginUser(data);
  }
}


class RegisterUserServiceUseCase {
  final AuthServiceRepository authServiceRepository;

  RegisterUserServiceUseCase({
    required this.authServiceRepository,
  });

  Future<Either<Failure, AuthResponse>> call(
      {required Map<String,dynamic> data}) async {
    return await authServiceRepository.registerUser(data);
  }
}
