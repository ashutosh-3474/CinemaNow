import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  int dateIndexSelected = 1;
  DateTime currentDate = DateTime.now();

  String _dayFormat(int dayWeek) {
    switch (dayWeek) {
      case 1:
        return "Monday";
        break;
      case 2:
        return "Tuesday";
        break;
      case 3:
        return "Wednesday";
        break;
      case 4:
        return "Thrusday";
        break;
      case 5:
        return "Friday";
        break;
      case 6:
        return "Saturday";
        break;
      case 7:
        return "Sunday";
        break;
      default:
        return "Monday";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // return Expanded(
    // flex: 13,

    // child:
    var date = currentDate.add(Duration(days: 1));
    Mycontroller mycontroller = Get.put(Mycontroller());
    String dateSelected = "${date.day}/${date.month}/${date.year}";
    mycontroller.ticketdetails.date = dateSelected.obs;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(color:primary, width: 1),
          // color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text("${dateSelected} ${_dayFormat(date.weekday)}",
            style: TextStyle(fontSize: 25, color: primary,fontWeight:FontWeight.w500 )),
      ),
    );
    //   Container(
    //     height: size.height * 0.15,
    //     // width: size.width * 0.90,
    //     padding: EdgeInsets.only(left: appPadding * 1.5, right: appPadding * 1.5),
    //     child: Stack(
    //       alignment: Alignment.centerLeft,
    //       children: [
    //         Container(
    //           decoration: BoxDecoration(
    //               color: white.withOpacity(0.1),
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(12),
    //                 bottomLeft: Radius.circular(12),
    //                 topRight: Radius.circular(12),
    //                 bottomRight: Radius.circular(12),
    //               )),
    //         ),
    //         Container(
    //           width: size.width,
    //           child: ListView.builder(
    //               itemCount: 1,
    //               scrollDirection: Axis.horizontal,
    //               itemBuilder: (context, index) {
    //                 var date = currentDate.add(Duration(days: 1));
    //                 return  Container(
    //                     padding: EdgeInsets.all(appPadding / 5),
    //                     margin: EdgeInsets.symmetric(
    //                       vertical: size.height * 0.02,
    //                       horizontal: 12,
    //                     ),
    //                     width: 44,
    //                     decoration: BoxDecoration(
    //                       color: dateIndexSelected == index
    //                           ? primary
    //                           : Colors.transparent,
    //                       borderRadius: BorderRadius.circular(5),
    //                     ),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Text(
    //                           date.day.toString(),
    //                           style: TextStyle(
    //                               fontSize: 22,
    //                               fontWeight: FontWeight.w600,
    //                               height: 1.0,
    //                               color:
    //                                   index == dateIndexSelected ? black : white),
    //                         ),
    //                         Text(
    //                           _dayFormat(date.weekday),
    //                           style: TextStyle(
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w600,
    //                             color: index == dateIndexSelected
    //                                 ? black
    //                                 : white.withOpacity(0.5),
    //                           ),
    //                         )
    //                       ],
    //                     ),

    //                 );
    //               }),
    //         )
    //       ],
    //     ),
    //     // ),
    //   );
  }
}
