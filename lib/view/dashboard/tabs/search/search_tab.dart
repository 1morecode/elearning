//
// Created by 1 More Code on 09/05/24.
//

import 'package:elearning/config/data.dart';
import 'package:elearning/view/dashboard/tabs/search/components/course_large_card.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 4/3),
      itemBuilder: (context, index) => CourseLargeCard(course: UniData.courses[index],),
      padding: const EdgeInsets.all(16),
      itemCount: UniData.courses.length,
    );
  }
}
