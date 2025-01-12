import 'package:dartz/dartz.dart';
import 'package:kiosk_finder/core/error/failure.dart';
import 'package:kiosk_finder/feature/home/domain/entities/kiosk_entity.dart';
import 'package:kiosk_finder/feature/home/domain/repositories/home_repository.dart';


class HomeUseCase {
  final HomeRepository homeRepository;

  HomeUseCase({
    required this.homeRepository,
  });

  Future<Either<Failure, List<KioskEntity>>> call(
      {required Map<String,dynamic> data}) async {
    return await homeRepository.getList(data);
  }
}
