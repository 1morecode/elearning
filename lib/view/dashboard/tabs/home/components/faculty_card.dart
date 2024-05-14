//
// Created by 1 More Code on 11/05/24.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../faculty/faculty_screen.dart';

class FacultyCard extends StatelessWidget {
  final dynamic faculty;

  const FacultyCard({super.key, this.faculty});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: (){
        print("Faculty Tapped");
        Navigator.push(context, MaterialPageRoute(builder: (context) => FacultyScreen(faculty: faculty,),));
      },
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: 130,
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: Colors.grey.withOpacity(0.1), width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(faculty['profilePhoto']),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  faculty['name'],
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "(${faculty['department']})",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: Text(
                    "${faculty['followers']} Followers",
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
