import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:kiosk_finder/core/error/exception.dart';
import 'package:kiosk_finder/core/error/failure.dart';
import 'package:kiosk_finder/core/network/network.dart';
import 'package:kiosk_finder/feature/home/data/data_sources/home_data_source.dart';
import 'package:kiosk_finder/feature/home/data/models/kiosk_model.dart';
import 'package:kiosk_finder/feature/home/domain/repositories/home_repository.dart';


class HomeModelRepository implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;
  HomeModelRepository({required this.homeRemoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, List<KioskModel>>> getList(Map<String, dynamic> userData) async {
    if (await networkInfo.isConnected()) {
      try {
        return Right(await homeRemoteDataSource.getList(userData));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }






}
