import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/models/movie_model.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:e_ticket/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    // initState();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            // width: 200,
            // height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ));
  }
}
