import 'package:flutter/material.dart';
import 'package:world_time_flutter/pages/choose_location.dart';
import 'package:world_time_flutter/pages/home.dart';
import 'package:world_time_flutter/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation()
    }
  ));

}



