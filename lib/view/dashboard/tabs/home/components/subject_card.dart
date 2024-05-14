//
// Created by 1 More Code on 11/05/24.
//

import 'package:elearning/view/dashboard/subject/subject_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final dynamic subject;
  const SubjectCard({super.key, this.subject});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.withOpacity(0.1), width: 2),
          borderRadius: BorderRadius.circular(6)
      ),
      child: CupertinoButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectScreen(subject: subject,),));
          print("Subject Tapped");
        },
        padding: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Icon(subject['icon'], color: Colors.black, size: 20,),
              ),
              const SizedBox(width: 10,),
              Expanded(
                  child: Text(
                    subject['subject'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

