//
// Created by 1 More Code on 17/05/24.
//

import 'package:elearning/view/dashboard/tabs/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: CupertinoTextField(
        placeholder: "Search Course, Branch Topics...",
        readOnly: true,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),)).then((value) {
            print("Then Completed");
          });
        },
        prefix: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            CupertinoIcons.search,
            size: 20,
            color: Colors.grey,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
