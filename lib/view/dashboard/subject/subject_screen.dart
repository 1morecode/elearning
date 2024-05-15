//
// Created by 1 More Code on 14/05/24.
//

import 'package:elearning/view/dashboard/subject/books/books_screen.dart';
import 'package:elearning/view/dashboard/subject/lectures/lectures_screen.dart';
import 'package:elearning/view/dashboard/subject/notes/notes_screen.dart';
import 'package:elearning/view/dashboard/subject/papers/papers_screen.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatefulWidget {
  final dynamic subject;

  const SubjectScreen({super.key, this.subject});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject['subject']),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            padding: EdgeInsets.all(0),
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.black,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 16),
            tabs: const [
              Tab(
                text: "Notes",
              ),
              Tab(
                text: "Lectures",
              ),
              Tab(
                text: "Books",
              ),
              Tab(
                text: "Previous Papers",
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          NotesScreen(subject: widget.subject,),
          LecturesScreen(),
          BooksScreen(),
          PapersScreen(),
        ],
      ),
    );
  }
}
