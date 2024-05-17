//
// Created by 1 More Code on 17/05/24.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../course/course_screen.dart';

class CourseLargeCard extends StatelessWidget {
  final dynamic course;

  const CourseLargeCard({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: course['color'],
      child: CupertinoButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          print("Card Tapped");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseScreen(
                  courseData: course,
                ),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                course['icon'],
                color: Colors.white,
                size: 42,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                course['course'],
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
