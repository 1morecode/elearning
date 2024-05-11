//
// Created by 1 More Code on 09/05/24.
//

import 'package:elearning/config/data.dart';
import 'package:elearning/view/dashboard/tabs/home/components/courses_card.dart';
import 'package:elearning/view/dashboard/tabs/home/components/subject_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/faculty_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        // Courses Heading
        Row(
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Top Courses",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
            )),
            CupertinoButton(
              onPressed: () {},
              minSize: 40,
              child: const Text("View All"),
            )
          ],
        ),
        // Courses List
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: UniData.courses.length,
            itemBuilder: (context, index) =>
                CoursesCard(course: UniData.courses[index]),
          ),
        ),

        // Subjects Heading
        Row(
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Trending  Subjects",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
            )),
            CupertinoButton(
              onPressed: () {},
              minSize: 40,
              child: const Text("View All"),
            )
          ],
        ),
        // Subjects List
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2 / 1),
          children: List.generate(
              UniData.popularSubjects.length,
              (index) => SubjectCard(
                    subject: UniData.popularSubjects[index],
                  )),
        ),
        // Subjects Heading
        Row(
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Top Rated Faculty",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
            )),
            CupertinoButton(
              onPressed: () {},
              minSize: 40,
              child: const Text("View All"),
            )
          ],
        ),
        // Faculties
        SizedBox(
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: UniData.topFaculties.length,
            itemBuilder: (context, index) =>
                FacultyCard(faculty: UniData.topFaculties[index]),
          ),
        ),
      ],
    );
  }
}
