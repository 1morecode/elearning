//
// Created by 1 More Code on 17/05/24.
//

import 'package:elearning/config/data.dart';
import 'package:elearning/view/dashboard/faculty/components/subject_large_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  List<dynamic> searchList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.clear();
  }

  searchSubject() {
    try {
      if (searchController.text.isNotEmpty) {
        String searchText = searchController.text;

        List<dynamic> list = UniData.popularSubjects.where((element) {
          if(element['subject'].toString().toLowerCase().contains(searchText.toLowerCase().trim())){
            return true;
          }
          return false;
        }).toList();

        setState(() {
          searchList = list;
        });
      } else {
        print("Search Field is Empty");

        // setState(() {
        //   searchList.clear();
        // });

      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: SizedBox(
          height: 40,
          child: CupertinoSearchTextField(
            controller: searchController,
            placeholder: "Search Course, Branch Topics...",
            autofocus: true,
            onSuffixTap: (){
              setState(() {
                searchController.clear();
                searchList.clear();
              });
            },
          ),
        ),
        actions: [
          CupertinoButton(
            onPressed: () {
              searchSubject();
            },
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            minSize: 30,
            child: const Text("Search"),
          )
        ],
      ),
      body: searchList.isNotEmpty
          ? ListView(
              children: List.generate(searchList.length,
                  (index) => SubjectLargeCard(subject: searchList[index],)),
            )
          : Center(
              child: Text("Data Not Found! ${searchList.length}"),
            ),
    );
  }
}
