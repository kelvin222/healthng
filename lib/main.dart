// @dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthng/pages/home.dart';

import 'pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Colors.blueAccent,
              iconTheme: IconThemeData(color: Colors.grey[900]),
              fontFamily: 'Muli',
              scaffoldBackgroundColor: Colors.grey[100],
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.grey[800],
                ),
                textTheme: TextTheme(
                    headline6: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w500
                    )),
                
              )),
      home: HomePage(),
    );
  }
}
