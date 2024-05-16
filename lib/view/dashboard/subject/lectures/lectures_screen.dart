//
// Created by 1 More Code on 15/05/24.
//

import 'package:elearning/model/lecture.dart';
import 'package:elearning/view/dashboard/subject/lectures/components/video_card.dart';
import 'package:flutter/material.dart';

import '../../../../config/data.dart';

class LecturesScreen extends StatelessWidget {
  final dynamic subject;

  const LecturesScreen({super.key, this.subject});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Lecture lecture = UniData.lectures
            .where((element) => element.subjectId == subject['id'])
            .toList()[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    lecture.heading,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ))
              ],
            ),
            ...List.generate(lecture.videos.length,
                (ind) => VideoCard(videoModel: lecture.videos[ind]))
          ],
        );
      },
      itemCount: UniData.lectures
          .where((element) => element.subjectId == subject['id'])
          .toList()
          .length,
    );
  }
}
