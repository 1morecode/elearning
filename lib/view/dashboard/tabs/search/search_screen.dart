//
// Created by 1 More Code on 17/05/24.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const SizedBox(
          height: 40,
          child: CupertinoSearchTextField(
            placeholder: "Search Course, Branch Topics...",
            autofocus: true,
          ),
        ),
        actions: [
          CupertinoButton(
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            minSize: 30,
            child: const Text("Search"),
          )
        ],
      ),
    );
  }
}
