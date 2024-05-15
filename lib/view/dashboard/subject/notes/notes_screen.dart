//
// Created by 1 More Code on 15/05/24.
//

import 'package:elearning/config/data.dart';
import 'package:elearning/view/dashboard/subject/notes/components/note_card.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  final dynamic subject;

  const NotesScreen({super.key, this.subject});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => NoteCard(note: UniData.notesList[index]),
      itemCount: UniData.notesList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
