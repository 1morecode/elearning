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
    {"branch": "Computer Science & Engineering", "courseId": "001", "icon": Icons.bookmarks_outlined},
    {"courseId": "001", "branch": "Electrical Engineering", "icon": Icons.bookmarks_outlined},
    {"courseId": "002", "branch": "Mechanical Engineering", "icon": Icons.bookmarks_outlined},
    {"courseId": "003", "branch": "Physics Engineering", "icon": Icons.bookmarks_outlined}
  ];

  static List<dynamic> popularSubjects = [
    {
      "subject": "Electronics & Communication",
      "icon": Icons.menu_book,
      "courseId": "001",
      "branchId": "101",
      "facultyId": "301",
      "year": 1,
      "semester": 1
    },
    {
      "subject": "Data Structure",
      "icon": Icons.menu_book,
      "courseId": "001",
      "branchId": "101",
      "facultyId": "301",
      "year": 1,
      "semester": 1
    },
    {
      "subject": "Advance Algorithm",
      "icon": Icons.menu_book,
      "courseId": "002",
      "branchId": "101",
      "facultyId": "302",
      "year": 1,
      "semester": 1
    },
    {
      "subject": "Mechanics",
      "icon": Icons.menu_book,
      "courseId": "003",
      "branchId": "101",
      "facultyId": "302",
      "year": 1,
      "semester": 1
    },
    {
      "subject": "Artificial Intelligence",
      "icon": Icons.menu_book,
      "courseId": "002",
      "branchId": "101",
      "facultyId": "303",
      "year": 1,
      "semester": 1
    },
    {
      "subject": "Machine Learning",
      "icon": Icons.menu_book,
      "courseId": "003",
      "branchId": "101",
      "facultyId": "304",
      "year": 1,
      "semester": 1
    }
  ];

  static List<dynamic> topFaculties = [
    {
      "id": "301",
      "name": "Ashish Kumar",
      "profilePhoto":
          "https://www.thelittlehawk.com/wp-content/uploads/2018/10/IMG-1246-900x675.jpg",
      "department": "Mechanical",
      "followers": 104,
      "bio": "M.tech (Computer Science) || Gold Medalist (Physics) || Prof. at BBD Group of Institutions"
    },
    {
      "id": "302",
      "name": "Rohit Pandey",
      "profilePhoto":
          "https://www.livelingua.com/img/profilesTeachers/103/Guillaume-Deneufbourg-Square_Profile_S.jpg",
      "department": "Electrical",
      "followers": 104,
      "bio": "M.tech (Computer Science) || Gold Medalist (Physics) || Prof. at BBD Group of Institutions"
    },
    {
      "id": "303",
      "name": "Pankaj Tiwari",
      "profilePhoto":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAQ6V9Oj7MV85EdzqAOCPAGDFfdBzugWQwZQgnnqSac0ENUX4bapOH8QfsFkwuWOt2CY0&usqp=CAU",
      "department": "CSE",
      "followers": 104,
      "bio": "M.tech (Computer Science) || Gold Medalist (Physics) || Prof. at BBD Group of Institutions"
    },
    {
      "id": "304",
      "name": "Aman Singh",
      "profilePhoto":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4ycQKueb-YzYMcMAF4OSsZMF-xEHlw_2SWTICYJfaPYmEK1rH_mnLybkif0qO996aQII&usqp=CAU",
      "department": "Mechanical",
      "followers": 104,
      "bio": "M.tech (Computer Science) || Gold Medalist (Physics) || Prof. at BBD Group of Institutions"
    }
  ];
}
