
import 'package:flutter/material.dart';
import 'Choose_location.dart';
import 'Home.dart';
import 'Loading.dart';
import 'get_location.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      '/' :(context)=> Loading(),
      '/Home' : (context)=> Home(),
      '/choose_location' : (context) => Choose_location(),
    },
  ));
}