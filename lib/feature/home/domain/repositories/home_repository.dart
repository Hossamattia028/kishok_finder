
import 'package:dartz/dartz.dart';
import 'package:kiosk_finder/core/error/failure.dart';
import 'package:kiosk_finder/feature/home/domain/entities/kiosk_entity.dart';


abstract class HomeRepository {
  Future<Either<Failure, List<KioskEntity>>> getList(Map<String, dynamic> data);
}
