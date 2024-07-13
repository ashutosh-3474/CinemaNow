// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/models/cast_model.dart';
import 'package:e_ticket/models/movie_model.dart';
import 'package:e_ticket/services/firebase_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieData{
  var movieList = <MovieModel>[].obs;
  
  // MovieData()
  // {
  //   // movieList = [].obs;
  //   Stream stream = FirebaseFirestore.instance.collection("Movie").snapshots();
  //   stream.listen((snapshot) {
  //     snapshot.docs.forEach((element) {
  //       MovieModel movie_temp = new MovieModel(
  //           id: element["id"],
  //           genre: element["genre"],
  //           name: element["name"],
  //           image: Image.asset("assets/togo.jpeg"),
  //           imageLogo: Image.asset("assets/togologo.png"));
  //       movieList.add(movie_temp as MovieModel);
  //       // print(movieList.length);
  //     });
  //   });
  //   movieList.add(
  //     MovieModel(
  //       id: 1,
  //       name: 'Joker',
  //       genre: ["Crime", "Drama"],
  //       image: Image.asset("assets/joker.jpeg"),
  //       imageLogo: Image.asset("assets/jokerlogo.png"),
        
  //     ),
  //   );
    
  // }
}
/*
class MovieData {
  List<MovieModel> movieList = [];
  final DatabaseServices _databaseServices = DatabaseServices();

  MovieData() {
    movieList = [];
    Stream stream = FirebaseFirestore.instance.collection("Movie").snapshots();
    // Stream<QuerySnapshot> stream = _databaseServices.getMovies();

    stream.listen((snapshot) {
      //   print(snapshot.docs[0]["genre"]);
      //   for(int i=0;i<snapshot.docs.length;i++){
      //     print(snapshot.docs[i]["id"]);
      //     movieList.add(MovieModel(
      //         id: snapshot.docs[i]["id"],
      //         genre: snapshot.docs[i]["genre"],
      //         name: snapshot.docs[i]["name"],
      //         image: Image.asset("assets/togo.jpeg"),
      //         imageLogo: Image.asset("assets/togologo.png")));
      // }
      snapshot.docs.forEach((element) {
        MovieModel movie_temp = new MovieModel(
            id: element["id"],
            genre: element["genre"],
            name: element["name"],
            image: Image.asset("assets/togo.jpeg"),
            imageLogo: Image.asset("assets/togologo.png"));
        movieList.add(movie_temp as MovieModel);
        print(movieList.last.name);
      });
    });

    // }

    print(movieList.length);
    // movieList = _databaseServices.getMovies().docs??[];
    // movieList = FirebaseFirestore.instance.collection("Movie").doc(0).collection("collectionPath");
    // StreamBuilder(
    //   stream: FirebaseFirestore.instance.collection("Movie").snapshots(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       if (snapshot.hasData) {
    //         for (int i = 0; i < snapshot.data!.size; i++) {
    //           print(snapshot.data!.docs[i]["name"]);
    //           movieList.add(MovieModel(
    //               id: snapshot.data!.docs[i]["id"],
    //               genre: snapshot.data!.docs[i]["genre"],
    //               name: snapshot.data!.docs[i]["name"],
    //               image: Image.asset("assets/togo.jpeg"),
    //               imageLogo: Image.asset("assets/togologo.png")));
    //         }
    //       } else if (snapshot.hasError) {
    //         return Center(
    //           child: Text(snapshot.hasError.toString()),
    //         );
    //       }
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     throw "";
    //   },
    // );
    // movieList.add(
    //   MovieModel(
    //     id: 0,
    //     name: 'Togo',
    //     // rating: 8.0,
    //     genre: [
    //       "Drama",
    //     ],
    // director: 'Ericson Core',
    // storyLine:
    // 'Togo (1913 – December 5, 1929) was the lead sled dog of Leonhard Seppala and his dog sled team in the 1925 serum run to Nome across central and northern Alaska. Even though he covered more distance (260 miles) than his co-sledder Balto (55 miles), he didn\'t get as much fame.',
    // image: Image.asset("assets/togo.jpeg"),
    // imageLogo: Image.asset("assets/togologo.png"),
    // castList: [
    // MovieCastModel(
    //   name: "Willem Dafoe",
    //   photo: Image.asset("assets/image/cast/willem.jpg"),
    // ),
    // MovieCastModel(
    //   name: "Julianne Nicholson",
    //   photo: Image.asset("assets/image/cast/julianne.jpg"),
    // ),
    // MovieCastModel(
    //   name: "Christopher Heyerdahl",
    //   photo: Image.asset("assets/cast/christopher.jpg"),
    // ),
    // MovieCastModel(
    //   name: "Michael McElhatton",
    //   photo: Image.asset("assets/image/cast/michael.jpg"),
    // )
    // ]
    //   ),
    // );
    movieList.add(
      MovieModel(
        id: 1,
        name: 'Joker',
        // rating: 8.5,
        genre: ["Crime", "Drama"],
        // director: 'Todd Phillips',
        // storyLine:
        // "Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he's part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.",
        image: Image.asset("assets/joker.jpeg"),
        imageLogo: Image.asset("assets/jokerlogo.png"),
        // castList: [
        //   MovieCastModel(
        //     name: "Joaquin Phoenix",
        //     photo: Image.asset("assets/cast/joaquin.jpg"),
        //   ),
        // MovieCastModel(
        //   name: "Robert De Niro",
        //   photo: Image.asset("assets/image/cast/niro.jpg"),
        // ),
        // MovieCastModel(
        //   name: "Zazie Beetz",
        //   photo: Image.asset("assets/image/cast/zazie.jpg"),
        // ),
        // MovieCastModel(
        //   name: "Frances Conroy",
        //   photo: Image.asset("assets/image/cast/frances.jpg"),
        // ),
        // ]
      ),
    );
    movieList.add(
      MovieModel(
        id: 2,
        name: 'Planet of the Apes',
        // rating: 5.7,
        genre: ["Action", "Adventure", "Fantasy"],
        // director: 'Tim Burton',
        // storyLine:
        // "Complex sociological themes run through this science-fiction classic about three astronauts marooned on a futuristic planet where apes rule and humans are slaves. The stunned trio discovers that these highly intellectual simians can both walk upright and talk. They have even established a class system and a political structure. The astronauts suddenly find themselves part of a devalued species, trapped and imprisoned by the apes.",
        image: Image.asset("assets/apes.jpeg"),
        imageLogo: Image.asset("assets/apeslogo.png"),
        // castList: [
        // MovieCastModel(
        //   name: "Cornelius",
        //   photo: Image.asset("assets/image/cast/cornelius.jpg"),
        // ),
        // MovieCastModel(
        //   name: "Dr. Zaius",
        //   photo: Image.asset("assets/image/cast/zaius.jpg"),
        // ),
        // MovieCastModel(
        //   name: "Dr. Zira",
        //   photo: Image.asset("assets/cast/zira.jpg"),
        // ),
        // MovieCastModel(
        //   name: "Nova",
        //   photo: Image.asset("assets/image/cast/nova.jpg"),
        // )
        // ]
      ),
    );
  }
}
*/
class ticketDetail {
  var movieName = "".obs;
  var seat = [].obs;
  var time = ''.obs;
  var date = ''.obs;
}
