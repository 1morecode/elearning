//
// Created by 1 More Code on 14/05/24.
//

import 'package:elearning/config/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../tabs/home/components/subject_card.dart';

class BranchScreen extends StatefulWidget {
  final dynamic branch;

  const BranchScreen({super.key, this.branch});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  static int selectedYear = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Map<int, Widget> generateBranchYears() {
    Map<int, Widget> branchYears = {};
    if (widget.branch.containsKey("years") && widget.branch['years'] != null) {
      for (int i = 0; i < widget.branch['years'].length; i++) {
        branchYears[i] = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            widget.branch['years'][i]["year"],
          ),
        );
      }
    }
    return branchYears;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.branch['branch']),
        centerTitle: false,
        titleSpacing: 5,
        bottom: generateBranchYears().length < 2
            ? PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 1),
                child: Container(),
              )
            : PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 50),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl<int>(
                          groupValue: selectedYear,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 4),
                          onValueChanged: (int? value) {
                            if (value != null) {
                              setState(() {
                                selectedYear = value;
                              });
                            }
                          },
                          children: generateBranchYears(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        children: [
          if (widget.branch.containsKey("years") &&
              widget.branch['years'] != null)
            ...List.generate(
                widget.branch['years'][selectedYear]['semesters'].length,
                (ind) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (UniData.popularSubjects
                            .where((element) =>
                                element['semesterId'] ==
                                widget.branch['years'][selectedYear]
                                    ['semesters'][ind]['id'])
                            .isNotEmpty)
                          Text(
                            widget.branch['years'][selectedYear]['semesters']
                                [ind]['semester'],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 2 / 1),
                          children: List.generate(
                              UniData.popularSubjects
                                  .where((element) =>
                                      element['semesterId'] ==
                                      widget.branch['years'][selectedYear]
                                          ['semesters'][ind]['id'])
                                  .length,
                              (i) => SubjectCard(
                                    subject: UniData.popularSubjects
                                        .where((element) =>
                                            element['semesterId'] ==
                                            widget.branch['years'][selectedYear]
                                                ['semesters'][ind]['id'])
                                        .toList()[i],
                                  )),
                        ),
                      ],
                    )),
        ],
      ),
    );
  }
}
