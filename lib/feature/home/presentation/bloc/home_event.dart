import 'package:flutter/material.dart';


@immutable
abstract class HomeEvent{
  const HomeEvent();
}


class FetchKiosks extends HomeEvent {  
  final String city;  

  const FetchKiosks(this.city);  
} 