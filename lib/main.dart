import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/data/data.dart';
import 'package:e_ticket/firebase_options.dart';
import 'package:e_ticket/models/movie_model.dart';
import 'package:e_ticket/screens/booking/components/seat_selector.dart';
import 'package:e_ticket/screens/home/home_screen.dart';
import 'package:e_ticket/screens/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.settings =
  //     const Settings(persistenceEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  initState() {

    // TODO: implement initState
    // super.initState();
    Mycontroller mycontroller = Mycontroller();
    Stream stream = FirebaseFirestore.instance.collection("Movie").snapshots();
    
    print ("inti state initialised");
    stream.listen((snapshot) {
      snapshot.docs.forEach((element) {
        MovieModel movie_temp = new MovieModel(
            id: element["id"],
            genre: element["genre"],
            name: element["name"],
            image: Image.asset("assets/togo.jpeg"),
            imageLogo: Image.asset("assets/togologo.png"));
        mycontroller.movieData.movieList.add(movie_temp as MovieModel);
        print("init state called");
        print(mycontroller.movieData.movieList.length);
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initState();
    Mycontroller mycontroller = Mycontroller();
    // mycontroller.movieData = MovieData();
    
    print("myapp${mycontroller.movieData.movieList.length}");
    return MaterialApp(
        title: 'Movie Ticket',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
