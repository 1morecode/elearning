//
// Created by 1 More Code on 15/05/24.
//

import 'package:elearning/view/dashboard/subject/books/components/book_card.dart';
import 'package:flutter/material.dart';

import '../../../../config/data.dart';

class BooksScreen extends StatelessWidget {
  final dynamic subject;
  const BooksScreen({super.key, this.subject});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BookCard(book: UniData.booksList.where((element) => element.subjectId == subject['id']).toList()[index]),
      itemCount: UniData.booksList.where((element) => element.subjectId == subject['id']).toList().length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
