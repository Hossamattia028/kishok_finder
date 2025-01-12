import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Util{
  // implemented this function after register and login
  static getAllUserAppData({required BuildContext context,bool isSplash=false,bool isJusProfile = false,})async{
  }




  static Future<bool> isConnected () async{
    try{
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
      return false;
    }catch(e){
      return false;
    }
  }

  static openMapApp(String lat,String long)async{
    var url = "https://www.google.com/maps/dir/?api=1&destination=$lat,$long&travelmode=driving";
    try {
      // await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint("openMapApp: $e");
    }
  }


  static bool checkUser(){
    return FirebaseAuth.instance.currentUser != null;
  }


  static pushPage(Widget route, BuildContext cxt) {
    return Navigator.push(
      cxt,
      MaterialPageRoute(builder: (context) => route),
    );
  }
  static pushPageAndRemoveRoutes(Widget pushRoute, BuildContext cxt) {
    Navigator.of(cxt).pushAndRemoveUntil(MaterialPageRoute(builder:
        (BuildContext ctx) => pushRoute),(route)=>false);
  }

  /// date time helper functions
  static bool isToday(DateTime dateTime){
    if(DateTime.now().year==dateTime.year&&DateTime.now().month==dateTime.month
      &&DateTime. now().day==dateTime.day){
      return true;
    }
    return false;
  }


  //location util

  static Future<bool> checkLocationPermission() async {
    try{
      // await Permission.location.request();
      // // await Permission.locationAlways.request();
      // // await Permission.locationWhenInUse.request();
      // if (await Permission.location.serviceStatus.isEnabled)return true;
      // debugPrint("checkLocationPermission ${await Permission.location.serviceStatus.isEnabled}");
      return false;
    }catch(e){
      debugPrint("checkLocationPermission $e");
      return false;
    }
  }
}
