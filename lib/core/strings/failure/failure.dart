// ignore_for_file: constant_identifier_names

import 'package:kiosk_finder/core/error/failure.dart';

const String SERVER_FAILURE_MESSAGE = 'بعد اذنك حاول مجددا';

const String EMPTY_FAILURE_MESSAGE = 'لا يوجد بيانات';

const String OFFLINE_FAILURE_MESSAGE = 'بعد اذنك تأكد من اتصالك بالانترنت';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure _:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure _:
      return EMPTY_FAILURE_MESSAGE;
    case OfflineFailure _:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return 'خطأ غير متوقع حاول مجددا';
  }
}
