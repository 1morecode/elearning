//
// Created by 1 More Code on 09/05/24.
//

import 'package:elearning/config/assets.dart';
import 'package:elearning/config/data.dart';
import 'package:elearning/view/dashboard/tabs/home/components/courses_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Courses Heading
        Row(
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Top Courses",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
            )),
            CupertinoButton(
              onPressed: () {},
              minSize: 40,
              child: const Text("View All"),
            )
          ],
        ),
        SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: UniData.courses.length,
              itemBuilder: (context, index) => CoursesCard(course: UniData.courses[index]),
            )

            // ListView(
            //   scrollDirection: Axis.horizontal,
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   children: const [
            //     ,
            //     CoursesCard(title: "B.Tech", icon:  CupertinoIcons.device_desktop, color: Colors.pink,),
            //     CoursesCard(title: "B.Tech", icon:  CupertinoIcons.device_desktop, color: Colors.pink,),
            //     CoursesCard(title: "B.Tech", icon:  CupertinoIcons.device_desktop, color: Colors.pink,),
            //     CoursesCard(title: "B.Tech", icon:  CupertinoIcons.device_desktop, color: Colors.pink,),
            //     CoursesCard(title: "B.Tech", icon:  CupertinoIcons.device_desktop, color: Colors.pink,),
            //     CoursesCard(title: "M.Tech", icon:  CupertinoIcons.device_desktop, color: Colors.amber,),
            //     CoursesCard(title: "BCA", icon:  CupertinoIcons.device_desktop, color: Colors.blueAccent,),
            //     CoursesCard(title: "MCA", icon:  CupertinoIcons.device_desktop, color: Colors.brown,),
            //     CoursesCard(title: "BSC", icon:  CupertinoIcons.device_desktop, color: Colors.indigoAccent,),
            //   ],
            // ),
            )
      ],
    );
  }
}
