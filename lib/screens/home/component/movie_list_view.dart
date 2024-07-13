import 'package:e_ticket/data/data.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:e_ticket/screens/home/component/movie_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MovieListView extends StatefulWidget {
  final double movieitemWidth;
  final ScrollController movieScrollController;

  const MovieListView(this.movieitemWidth, this.movieScrollController,
      {super.key});

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  // var movieData = MovieData();
  Mycontroller mycontroller = Mycontroller();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => TweenAnimationBuilder(
        duration: Duration(milliseconds: 700),
        tween: Tween<double>(begin: 600, end: 0),
        curve: Curves.easeOutCubic,
        builder: (_, value, child) {
          return Transform.translate(
            offset: Offset(value, 0),
            child: child,
          );
        },
        child: Container(
          height: size.height * 0.8,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: ScrollSnapList(
                listController: widget.movieScrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // print(mycontroller.movieData.movieList.length);
                  // var idx = index % mycontroller.movieData.movieList.length;
                  return MovieIndex(index, widget.movieitemWidth,
                      widget.movieScrollController);
                },
                padding: EdgeInsets.zero,
                itemCount: mycontroller.movieData.movieList.length,
                itemSize: widget.movieitemWidth,
                onItemFocus: (item) {}),
          ),
        ),
      ),
    );
  }
}
