import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BuildChairs {
  static Widget selectedChair(int row, int col) {
    Mycontroller mycontroller = Get.put(Mycontroller());
    return InkWell(
      child: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(6.0)),
      ),
      onTap: () {
        mycontroller.disselectseat(row, col);
      }
    );
  }

  static Widget availableChair( int row, int col) {
    Mycontroller mycontroller = Get.put(Mycontroller());
    return InkWell(
      child: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
            // color: select==true?secondary:null,
            border: Border.all(color: white),
            borderRadius: BorderRadius.circular(6.0)),
      ),
      onTap: () {
        // print ("row: $row, col: $col");
        mycontroller.selectseat(row, col);
      },
    );
  }

  static Widget reservedChair() {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(6.0)),
    );
  }
}
