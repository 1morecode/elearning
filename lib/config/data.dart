//
// Created by 1 More Code on 09/05/24.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UniData {
  static List<dynamic> courses = [
    {
      "id": "001",
      "course": "B.Tech",
      "icon": CupertinoIcons.desktopcomputer,
      "color": Colors.green,
    },
    {
      "id": "002",
      "course": "M.Tech",
      "icon": CupertinoIcons.desktopcomputer,
      "color": Colors.indigoAccent
    },
    {
      "id": "003",
      "course": "BSC",
      "icon": CupertinoIcons.desktopcomputer,
      "color": Colors.deepOrangeAccent
    },
    {
      "id": "004",
      "course": "MSC",
      "icon": CupertinoIcons.desktopcomputer,
      "color": Colors.lightBlue
    },
    {
      "id": "005",
      "course": "B.Com",
      "icon": CupertinoIcons.desktopcomputer,
      "color": Colors.orangeAccent
    }
  ];


  static List<dynamic> branches = [
    {
      "branch": "Computer Science & Engineering",
      "courseId": "001",
      "icon": Icons.abc,
      "years": [
        {
          "year": "1st Yr",
          "syllabus": [
            {
              "syllabus": "Data Structure",
              "code": "BCS012"
            }
          ]
        },
        {
          "year": "2nd Yr",
          "syllabus": [

          ]
        },
        {
          "year": "3rd Yr",
          "syllabus": [

          ]
        },
        {
          "year": "4th Yr",
          "syllabus": [

          ]
        }
      ]
    },
    {
      "courseId": "002",
      "branch": "Electrical Engineering",
      "icon": Icons.abc
    },
    {
      "courseId": "002",
      "branch": "Mechanical Engineering",
      "icon": Icons.abc
    }
  ];

}

