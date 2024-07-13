import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeSelector extends StatefulWidget {
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int timeIntexSelected = 1;
  
  var time = [
    "01.30",
    "06.30",
    "10.30"
  ];

  Widget _timeItem(String time, int price, bool active) {
    
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: appPadding * 0.75),
      decoration: BoxDecoration(
        border: Border.all(
          color: active ? primary : white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  text: time,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: active ? primary : white,
                  ),
                  children: <TextSpan>[
                TextSpan(
                    text: ' PM',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: active ? primary : white,
                    ))
              ])),
          
        ],
      ),
    );
  }
  Mycontroller mycontroller = Get.put(Mycontroller());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // return Expanded(
    // flex: 17,
    // child:
        mycontroller.ticketdetails.time = time[timeIntexSelected].obs;

    return Container(
      height: size.height * 0.08,
      width: size.width * 0.80,
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.035,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12,
          );
        },  
        itemBuilder: (context, index) {
          return Container(
            // margin: EdgeInsets.only(left: index == 0 ? 32 : 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  timeIntexSelected = index;
                });
              },
              child: _timeItem(
                  time[index].toString(),
                  int.parse(time[index][1].toString()),
                  index == timeIntexSelected ? true : false),
            ),
          );
        },
      ),
      // ),
    );
  }
}
