import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/data/data.dart';
import 'package:e_ticket/models/cast_model.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundListView extends StatefulWidget {
  final ScrollController backgroundScrollController;
  const BackgroundListView(this.backgroundScrollController, {super.key});

  @override
  State<BackgroundListView> createState() => _BackgroundListViewState();
}

class _BackgroundListViewState extends State<BackgroundListView> {
  // var movieData = MovieData();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Mycontroller mycontroller = Mycontroller();
    print("movieData.movieList.length${mycontroller.movieData.movieList.length}");

    return Obx(
      () => ListView.builder(
          controller: widget.backgroundScrollController,
          reverse: true,
          padding: EdgeInsets.zero,
          itemCount: mycontroller.movieData.movieList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            
            return Container(
                width: size.width,
                height: size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: -size.width / 3,
                      right: -size.width / 3,
                      child: Image(
                        image: mycontroller
                            .movieData.movieList[index].image!.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: black.withOpacity(0.4),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                black.withOpacity(0.3),
                                black.withOpacity(0.95),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.5, 0.9])),
                    )
                  ],
                ));
          }),
    );
  }
}
