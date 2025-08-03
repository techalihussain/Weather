import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
class Location{
  double ?longitude;
  double ?latitude;
  Future<void> getcurrentlocation()async{
    try{
      var status = await Permission.location.request();
      if (status != PermissionStatus.granted) {
        throw Exception('Location permission not granted');
      }
      Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    longitude=position.longitude;
    latitude=position.latitude;
    }
    catch (e){
      print(e);
    }
  }
}