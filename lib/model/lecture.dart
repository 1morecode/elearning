//
// Created by 1 More Code on 16/05/24.
//

import 'package:flutter/material.dart';

class Lecture {
  String heading;
  String subjectId;
  int position;
  List<VideoModel> videos;

  Lecture({required this.heading, required this.position, required this.subjectId, required this.videos});
}

class VideoModel {
  String title;
  Duration duration;
  String creator;
  String views;
  String thumbnail;
  String url;

  VideoModel(
      {required this.thumbnail,
      required this.views,
      required this.title,
      required this.creator,
      required this.duration,
      required this.url});
}
