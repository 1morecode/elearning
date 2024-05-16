//
// Created by 1 More Code on 16/05/24.
//

import 'package:flutter/material.dart';

class Book {
  String id;
  String subjectId;
  String title;
  String writer;
  int pages;
  int views;
  String seller;
  String thumbnail;
  String file;

  Book({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.views,
    required this.file,
    required this.pages,
    required this.thumbnail,
    required this.seller,
    required this.writer,
  });
}