import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/models/movie_model.dart';
import 'package:firebase_core/firebase_core.dart';

const String movie_collection_ref = "Movie";

class DatabaseServices {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _movieRef;
  DatabaseServices() {
    _movieRef =
        _firestore.collection(movie_collection_ref).withConverter<MovieModel>(
              fromFirestore: (snapshots, _) =>
                  MovieModel.fromJson(snapshots.data()!),
              toFirestore: (MovieModel,_)=>MovieModel.toJson()
            );
  }
  Stream<QuerySnapshot> getMovies() {
    return _movieRef.snapshots();
  }

  
}
