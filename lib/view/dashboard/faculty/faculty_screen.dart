//
// Created by 1 More Code on 13/05/24.
//

import 'package:elearning/config/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/subject_large_card.dart';

class FacultyScreen extends StatelessWidget {
  final dynamic faculty;

  const FacultyScreen({super.key, this.faculty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(faculty['profilePhoto']),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                faculty['name'],
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "(${faculty['department']})",
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                faculty['bio'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "${faculty['followers']} Followers",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )),
                  CupertinoButton(
                    onPressed: () {},
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                    minSize: 25,
                    child: const Text(
                      "Follow",
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Text(
                    "Subjects",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  )),
                ],
              ),
              ...List.generate(
                  UniData.popularSubjects
                      .where((element) => element['facultyId'] == faculty['id'])
                      .toList()
                      .length,
                  (index) => SubjectLargeCard(subject: UniData.popularSubjects.where((element) => element['facultyId'] == faculty['id'])
                      .toList()[index],))
            ],
          )
        ],
      ),
    );
  }
}
