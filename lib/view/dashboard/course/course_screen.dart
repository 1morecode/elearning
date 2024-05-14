//
// Created by 1 More Code on 13/05/24.
//

import 'package:elearning/config/data.dart';
import 'package:flutter/material.dart';

import 'components/branch_card.dart';

class CourseScreen extends StatelessWidget {
  final dynamic courseData;

  const CourseScreen({super.key, this.courseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
              color: courseData['color'],
              borderRadius: BorderRadius.circular(6)),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: [
              const BackButton(
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                courseData['icon'],
                color: Colors.white,
                size: 22,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                courseData['course'],
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Row(
            children: [
              Expanded(
                  child: Text(
                "All Branches",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              )),
            ],
          ),
          ...List.generate(
              UniData.branches
                  .where((element) => element['courseId'] == courseData['id'])
                  .toList()
                  .length,
              (index) => BranchCard(
                    branch: UniData.branches
                        .where((element) =>
                            element['courseId'] == courseData['id'])
                        .toList()[index],
                  ))
        ],
      ),
    );
  }
}
