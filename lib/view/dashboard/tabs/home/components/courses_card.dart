//
// Created by 1 More Code on 09/05/24.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursesCard extends StatelessWidget {
  final dynamic course;

  const CoursesCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: (){
        print("Card Tapped");
      },
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          elevation: 0,
          color: course['color'],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(course['icon'], color: Colors.white,),
                const SizedBox(height: 10,),
                Text(
                  course['course'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
