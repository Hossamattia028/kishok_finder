
import 'package:dartz/dartz.dart';
import 'package:kiosk_finder/core/error/exception.dart';
import 'package:kiosk_finder/core/error/failure.dart';
import 'package:kiosk_finder/core/network/network.dart';
import 'package:kiosk_finder/feature/authentication/data/data_sources/authentication_data_source.dart';
import 'package:kiosk_finder/feature/authentication/data/models/auth_response.dart';
import 'package:kiosk_finder/feature/authentication/domain/repositories/auth_service_repository.dart';

class AuthServiceModelRepository implements AuthServiceRepository {
  final AuthServiceRemoteDataSource userServiceRemoteDataSource;
  final NetworkInfo networkInfo;
  AuthServiceModelRepository({required this.userServiceRemoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, AuthResponse>> loginUser(Map<String, dynamic> userData) async {
    if (await networkInfo.isConnected()) {
      try {
        return Right(await userServiceRemoteDataSource.loginUser(userData));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

   @override
  Future<Either<Failure, AuthResponse>> registerUser(Map<String, dynamic> userData) async {
    if (await networkInfo.isConnected()) {
      try {
        return Right(await userServiceRemoteDataSource.registerUser(userData));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }





}
