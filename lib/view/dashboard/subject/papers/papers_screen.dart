//
// Created by 1 More Code on 15/05/24.
//

import 'package:elearning/view/dashboard/subject/papers/components/answer_card.dart';
import 'package:elearning/view/dashboard/subject/papers/components/question_card.dart';
import 'package:flutter/material.dart';

import '../../../../config/data.dart';
import '../../../../model/pape.dart';

class PapersScreen extends StatelessWidget {
  final dynamic subject;

  const PapersScreen({super.key, this.subject});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Paper paper = UniData.papers
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
                    paper.year,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(child: paper.question.isNotEmpty ? QuestionCard(url: paper.question) : Container()),
                  Expanded(child: paper.answer.isNotEmpty ? AnswerCard(url: paper.answer) : Container())
                ],
              ),
            )
          ],
        );
      },
      itemCount: UniData.papers
          .where((element) => element.subjectId == subject['id'])
          .toList()
          .length,
    );
  }
}
