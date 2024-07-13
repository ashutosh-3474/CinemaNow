import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:e_ticket/screens/payment/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Mycontroller mycontroller = Get.put(Mycontroller());
    return Expanded(
        flex: 13,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 15.0,
                        width: 15.0,
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: white),
                        ),
                      ),
                      Text(
                        "Available",
                        style: TextStyle(
                          fontSize: 12,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 15.0,
                        width: 15.0,
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: white),
                      ),
                      Text(
                        "Resvered",
                        style: TextStyle(
                          fontSize: 12,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 15.0,
                        width: 15.0,
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: primary),
                      ),
                      Text(
                        "Selected",
                        style: TextStyle(
                          fontSize: 12,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: secondary),
                // color: secondary,
                onPressed: () {
                  int amount = mycontroller.countselected();
                  amount == 0
                      ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Center(
                            child: Text(
                              'Please select a seat',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          backgroundColor: Colors.black.withOpacity(0.8),
                        ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => paymentScreen(
                                    amount,
                                  )));
                },
                // shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0))
                // ),
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.065,
                  child: Center(
                    child: Text(
                      'Pay & Book Now',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
