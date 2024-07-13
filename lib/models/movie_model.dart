import 'package:e_ticket/models/cast_model.dart';
import 'package:flutter/material.dart';

class MovieModel {
  int? id;
  String? name;
  List<dynamic>? genre;
  // double rating;
  // String director;
  // String storyLine;
  Image? image;
  Image? imageLogo;
  // List<MovieCastModel> castList = [];

  MovieModel({
    required this.id,
    required this.genre,
    required this.name,
    // required this.rating,
    // required this.director,
    // required this.storyLine,
    required this.image,
    required this.imageLogo,
    // required this.castList,
  });
  MovieModel.fromJson(Map<String, Object?> json) {
    id:
    json["id"]! as int;
    name:
    json["name"]! as String;
    genre:
    json["genre"]! as List;
    image:
    json["image"]! as Image;
    imageLogo:
    json["imagelogo"]! as Image;
  }
  Map<String, Object> toJson() {
    return {
      'id': id!,
      "name": name!,
      "genre": genre!,
      "image": image!,
      "imagelogo": imageLogo!,
      
    };
  }
}
