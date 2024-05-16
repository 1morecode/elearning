//
// Created by 1 More Code on 16/05/24.
//

import 'package:flutter/material.dart';

class Paper {
  String year;
  String question;
  String answer;
  String subjectId;

  Paper(
      {required this.subjectId,
      required this.answer,
      required this.question,
      required this.year});
}
