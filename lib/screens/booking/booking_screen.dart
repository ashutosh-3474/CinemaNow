import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/screens/booking/components/date_selector.dart';
import 'package:e_ticket/screens/booking/components/pay_button.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:e_ticket/screens/booking/components/time_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  final String movieName;

  BookingScreen({required this.movieName});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    Mycontroller mycontroller = Get.put(Mycontroller());
    mycontroller.ticketdetails.movieName = widget.movieName.obs;
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 11),
        child: Column(
          children: [
            //date selector
            DateSelector(),
            //Time selector
            TimeSelector(),
            //Seat selector
            SeatSelector(),
            //Pay button and seat categories
            PayButton(),
          ],
        ),
      ),
    );
  }
}
