

import 'package:kiosk_finder/feature/home/domain/entities/kiosk_entity.dart';

class KioskModel extends KioskEntity {  
  const KioskModel({  
    required super.name,  
    required super.lat,  
    required super.lng,  
    required super.address,  
    required super.image,  
  });  

  factory KioskModel.fromJson(Map<String, dynamic> json) {  
    return KioskModel(  
      name: json['name'],  
      lat: json['lat'],  
      lng: json['lng'],  
      address: json['address'],  
      image: json['image'],  
    );  
  }  
} 