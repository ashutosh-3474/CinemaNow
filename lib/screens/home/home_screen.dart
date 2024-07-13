import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/models/movie_model.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:e_ticket/screens/home/component/background_list_view.dart';
import 'package:e_ticket/screens/home/component/movie_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size get size => MediaQuery.of(context).size;
  double get movieItemWidth => size.width / 2 + 48;
  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();
  
  

  @override
  Widget build(BuildContext context) {
    movieScrollController.addListener(() {
      backgroundScrollController
          .jumpTo(movieScrollController.offset * (size.width / movieItemWidth));
    });
    // initState();
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundListView(backgroundScrollController),
          MovieListView(movieItemWidth, movieScrollController),
        ],
      ),
    );
  }
}
