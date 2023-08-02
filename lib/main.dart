
import 'package:flutter/material.dart';
import 'package:test_flutter/pages/choose_location.dart';
import 'package:test_flutter/pages/home.dart';
import 'package:test_flutter/pages/loading.dart';

// https://docs.flutter.dev/cookbook -- important

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => HomePage(),
      '/location':(context) => chooseLocation()
    },
  )); 
}
