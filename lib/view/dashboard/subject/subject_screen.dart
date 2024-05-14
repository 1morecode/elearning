//
// Created by 1 More Code on 14/05/24.
//

import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  final dynamic subject;
  const SubjectScreen({super.key, this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject['subject']),),
    );
  }
}
