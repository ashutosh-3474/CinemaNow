// import 'dart:ffi';
//
// import 'dart:ffi';

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/data/data.dart';
import 'package:e_ticket/models/movie_model.dart';
import 'package:e_ticket/widget/build_chair.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SeatMatrix {
  var seatmatrix = <String>[
    "111111111111111",
    "111111111111111",
    "111111111111111",
    "111111111111111",
    "111111111111111",
    "111111111111111",
    "111111111111111",
    "111111111111111",
    "111111111111111",
    "111111111111111",
    
  ].obs;
}

class Mycontroller extends GetxController {
  var seatmatrix = SeatMatrix();
  var ticketdetails = ticketDetail();
  var movieData = MovieData();
  void selectseat(int row, int col) {
    // print(seatmatrix.seatmatrix[row][col]);
    final chars = seatmatrix.seatmatrix[row].split('');
    chars[col] = '2';
    seatmatrix.seatmatrix[row] = chars.join('');
    // print(chars);

    // print(seatmatrix.seatmatrix[row][col]);
  }

  void disselectseat(int row, int col) {
    // print(seatmatrix.seatmatrix[row][col]);
    final chars = seatmatrix.seatmatrix[row].split('');
    chars[col] = '1';
    seatmatrix.seatmatrix[row] = chars.join('');
    // print(chars);

    // print(seatmatrix.seatmatrix[row][col]);
  }
  void database_service()
  {
    // Stream stream = FirebaseFirestore.instance.collection("Movie").snapshots();
    // stream.listen((snapshot) {
    //   snapshot.docs.forEach((element) {
    //     MovieModel movie_temp = new MovieModel(
    //         id: element["id"],
    //         genre: element["genre"],
    //         name: element["name"],
    //         image: Image.asset("assets/togo.jpeg"),
    //         imageLogo: Image.asset("assets/togologo.png"));
    //     movieList.add(movie_temp as MovieModel);
    //     // print(movieList.length);
    //   });
    // });
  }

  int countselected() {
    int price = 0;
    ticketdetails.seat = [].obs;
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 15; j++) {
        if (seatmatrix.seatmatrix[i].substring(j, j + 1) == '2') {
          
          ticketdetails.seat
              .add(ascii.decode([i + 65]).toString() + (j + 1).toString());
          if (i < 5)
            price = price + 15;
          else
            price = price + 25;
        }
      }
    }
    return price;
  }
}

class SeatSelector extends StatefulWidget {
  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  Mycontroller mycontroller = Get.put(Mycontroller());
  Widget _chairList() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        // color: Colors.,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < 10; i++)
                Container(
                  margin: EdgeInsets.only(
                      top: i == 5 ? 50 : 15, bottom: i == 9 ? 15 : 0),
                  child: Row(
                    children: [
                      for (int j = 0; j < 15; j++)
                        Obx(() => Container(
                              margin: EdgeInsets.only(
                                  left: j == 4 || j == 11 ? 50 : 15,
                                  right: j == 14 ? 15 : 0),
                              child: mycontroller.seatmatrix.seatmatrix[i]
                                          .substring(j, j + 1) ==
                                      '1'
                                  ? BuildChairs.availableChair(i, j)
                                  : mycontroller.seatmatrix.seatmatrix[i]
                                              .substring(j, j + 1) ==
                                          '2'
                                      ? BuildChairs.selectedChair(i, j)
                                      : BuildChairs.reservedChair(),
                            ))
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  // Widget _chairList() {
  //   Size size = MediaQuery.of(context).size;

  //   // 1 is free seats
  //   // 2 is selected seats
  //   // 3 is reserved seats

  //   var _chairStatus = [
  //     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1],
  //     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  //   ];

  //   return Container(
  //     // height: size.height * 0.6,
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: <Widget>[
  //           for (int i = 0; i < 12; i++)
  //             Container(
  //               margin: EdgeInsets.only(
  //                   top: i == 4 || i == 8 ? size.height * .02 : 0),
  //               child: Row(
  //                 children: <Widget>[
  //                   for (int x = 0; x < 12; x++)
  //                     Expanded(
  //                       flex: 1,
  //                       child: x == 0 ||
  //                               x == 8 ||
  //                               x == 12 ||
  //                               (i == 0 && x == 1) ||
  //                               (i == 0 && x == 11) ||
  //                               (x == 4)
  //                           ? Container()
  //                           : Container(
  //                               height: size.width / 11 - 10,
  //                               margin: EdgeInsets.all(5),
  //                               child: _chairStatus[i][x - 1] == 1
  //                                   ? BuildChairs.availableChair(true)
  //                                   : _chairStatus[i][x - 1] == 2
  //                                       ? BuildChairs.selectedChair()
  //                                       : BuildChairs.reservedChair(),
  //                             ),
  //                     ),
  //                 ],
  //               ),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 21),
          child: Text("Screen This Side",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
            width: size.width * 0.95,
            height: size.height * 0.51,
            child: _chairList()),
        SizedBox(
          height: size.height * 0.02,
        )
      ],
    );
  }
}
