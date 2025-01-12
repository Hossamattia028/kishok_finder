import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_finder/feature/home/data/models/kiosk_model.dart';

abstract class HomeRemoteDataSourceImpl {
  Future<List<KioskModel>> getList(Map<String, dynamic> userData);
}

class HomeRemoteDataSource implements HomeRemoteDataSourceImpl {
  final DatabaseReference databaseRef;
  HomeRemoteDataSource({required this.databaseRef});



  @override
  Future<List<KioskModel>> getList(Map<String, dynamic> data) async {
    List<KioskModel> kiosks = [];  

    String path = data['city'].toLowerCase(); 
    
    try {  
      DatabaseEvent event = await databaseRef.child(path).once();  
      DataSnapshot snapshot = event.snapshot;  

       if (snapshot.exists) {  
        // Convert to Map<Object?, Object?> first  
        Map<Object?, Object?> data = snapshot.value as Map<Object?, Object?>;  

        // Now, iterate through the data and convert it to KioskModel  
        data.forEach((key, value) {  
          // Ensure value is also of type Map<Object?, Object?> before casting  
          if (value is Map<Object?, Object?>) {  
            kiosks.add(KioskModel.fromJson(value.cast<String, dynamic>()));  
          }  
        });  
      }   
    } catch (e) {  
      debugPrint('Error fetching data: $e');  
    }  

    return kiosks; 
  }
}