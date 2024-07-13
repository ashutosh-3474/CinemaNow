import 'package:e_ticket/constants/constants.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:e_ticket/screens/ticket/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class paymentScreen extends StatefulWidget {
  int amount;
  paymentScreen(this.amount,{super.key});

  @override
  State<paymentScreen> createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Mycontroller mycontroller = Get.put(Mycontroller());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(
                // alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "Movie: ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      mycontroller.ticketdetails.movieName.value,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "Time: ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      mycontroller.ticketdetails.time.value,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "Date: ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      mycontroller.ticketdetails.date.value,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "Seat: ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      mycontroller.ticketdetails.seat.value.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Amount: ',
                  style: TextStyle(fontSize: 30,color: Colors.white,),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                Text(
                  'Rs.${widget.amount}',
                  style: TextStyle(fontSize: 30,color: Colors.white,),
                ),
              ],
            ),
            SizedBox(height: size.height*0.04,),
            Center(
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: secondary),
                // color: secondary,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TicketScreen()), (Route<dynamic> route) => false);
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
        ),
      ),
    );
  }
}
