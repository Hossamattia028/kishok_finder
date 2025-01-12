import 'package:equatable/equatable.dart';

class KioskEntity extends Equatable {
  final String name;  
  final double lat;  
  final double lng;  
  final String address;  
  final String image;  



  const KioskEntity({
     required this.name,  
    required this.lat,  
    required this.lng,  
    required this.address,  
    required this.image,  
  });

  @override
  List<Object?> get props => [name];
}

