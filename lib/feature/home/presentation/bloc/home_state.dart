
import 'package:flutter/material.dart';
import 'package:kiosk_finder/feature/home/domain/entities/kiosk_entity.dart';

@immutable
abstract class HomeState{
  const HomeState();
}


class HomeInitState extends HomeState{}




// States  
class KioskState extends HomeState{  
  final List<KioskEntity> kiosks;  
  final bool isLoading;  
  final String error;  

  const KioskState({this.kiosks = const [], this.isLoading = false, this.error = ''});  
} 