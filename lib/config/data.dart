//
// Created by 1 More Code on 09/05/24.
//

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';


import 'package:elearning/model/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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
      "id": "101",
      "branch": "Computer Science & Engineering",
      "courseId": "001",
      "icon": Icons.bookmarks_outlined,
      "years": [
        {
          "year": "1st Yr",
          "semesters": [
            {"id": "501", "semester": "Semester 1"},
            {"id": "502", "semester": "Semester 2"}
          ]
        },
        {
          "year": "2nd Yr",
          "semesters": [
            {"id": "503", "semester": "Semester 3"},
            {"id": "504", "semester": "Semester 4"}
          ]
        },
        {
          "year": "3rd Yr",
          "semesters": [
            {"id": "505", "semester": "Semester 5"},
            {"id": "506", "semester": "Semester 6"}
          ]
        },
        {
          "year": "4th Yr",
          "semesters": [
            {"id": "507", "semester": "Semester 7"},
            {"id": "508", "semester": "Semester 8"}
          ]
        }
      ]
    },
    {
      "id": "102",
      "courseId": "001",
      "branch": "Electrical Engineering",
      "icon": Icons.bookmarks_outlined,
      "years": [
        {
          "year": "1st Yr",
          "semesters": [
            {"id": "501", "semester": "Semester 1"},
            {"id": "502", "semester": "Semester 2"}
          ]
        },
        {
          "year": "2nd Yr",
          "semesters": [
            {"id": "503", "semester": "Semester 3"},
            {"id": "504", "semester": "Semester 4"}
          ]
        }
      ]
    },
    {
      "id": "103",
      "courseId": "002",
      "branch": "Mechanical Engineering",
      "icon": Icons.bookmarks_outlined,
    },
    {
      "id": "104",
      "courseId": "003",
      "branch": "Physics Engineering",
      "icon": Icons.bookmarks_outlined,
    }
  ];

  static List<dynamic> popularSubjects = [
    {
      "id": "601",
      "subject": "Electronics & Communication",
      "icon": Icons.menu_book,
      "courseId": "001",
      "branchId": "101",
      "semesterId": "501",
      "facultyId": "301",
      "year": 1,
    },
    {
      "id": "602",
      "subject": "Data Structure",
      "icon": Icons.menu_book,
      "courseId": "001",
      "branchId": "101",
      "facultyId": "301",
      "year": 1,
      "semesterId": "502",
    },
    {
      "id": "603",
      "subject": "Advance Algorithm",
      "icon": Icons.menu_book,
      "courseId": "002",
      "branchId": "101",
      "facultyId": "302",
      "year": 1,
      "semesterId": "501",
    },
    {
      "id": "604",
      "subject": "Mechanics",
      "icon": Icons.menu_book,
      "courseId": "003",
      "branchId": "101",
      "facultyId": "302",
      "year": 1,
      "semesterId": "502",
    },
    {
      "id": "605",
      "subject": "Artificial Intelligence",
      "icon": Icons.menu_book,
      "courseId": "002",
      "branchId": "101",
      "facultyId": "303",
      "year": 1,
      "semesterId": "503",
    },
    {
      "id": "606",
      "subject": "Machine Learning",
      "icon": Icons.menu_book,
      "courseId": "003",
      "branchId": "101",
      "facultyId": "304",
      "year": 1,
      "semesterId": "504",
    }
  ];

  static List<Note> notesList = [
    Note(
        id: "701",
        subjectId: "601",
        title: "Electronics - Unit 1",
        views: 234,
        file: "https://pages.uoregon.edu/rayfrey/DigitalNotes.pdf",
        pages: 12,
        thumbnail:
            "https://handwrittennotes.in/wp-content/uploads/2022/03/Screenshot-368-1.png",
        unit: "UNIT 1",
        writer: "Ashish Kumar"),
    Note(
        id: "702",
        subjectId: "601",
        title: "Electronics - Unit 2",
        views: 234,
        file: "https://pages.uoregon.edu/rayfrey/DigitalNotes.pdf",
        pages: 12,
        thumbnail:
            "https://imgv2-2-f.scribdassets.com/img/document/392171919/original/e45aaffddf/1715353775?v=1",
        unit: "UNIT 2",
        writer: "Ashish Kumar"),
    Note(
        id: "703",
        subjectId: "601",
        title: "Electronics - Unit 3",
        views: 234,
        file: "https://pages.uoregon.edu/rayfrey/DigitalNotes.pdf",
        pages: 12,
        thumbnail:
            "https://shop.handwrittennotes.in/wp-content/uploads/2022/12/WhatsApp-Image-2022-12-30-at-7.48.03-PM-2.jpeg",
        unit: "UNIT 3",
        writer: "Ashish Kumar")
  ];

  static List<dynamic> topFaculties = [
    {
      "id": "301",
      "name": "Ashish Kumar",
      "profilePhoto":
          "https://www.thelittlehawk.com/wp-content/uploads/2018/10/IMG-1246-900x675.jpg",
      "department": "Mechanical",
      "followers": 104,
      "bio":
          "M.tech (Computer Science) || Gold Medalist (Physics) || Prof. at BBD Group of Institutions"
    },
    {
      "id": "302",
      "name": "Rohit Pandey",
      "profilePhoto":
          "https://www.livelingua.com/img/profilesTeachers/103/Guillaume-Deneufbourg-Square_Profile_S.jpg",
      "department": "Electrical",
      "followers": 104,
      "bio":
          "M.tech (Computer Science) || Gold Medalist (Physics) || Prof. at BBD Group of Institutions"
    },
    {
      "id": "303",
      "name": "Pankaj Tiwari",
      "profilePhoto":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAQ6V9Oj7MV85EdzqAOCPAGDFfdBzugWQwZQgnnqSac0ENUX4bapOH8QfsFkwuWOt2CY0&usqp=CAU",
      "department": "CSE",
      "followers": 104,
      "bio":
          "M.tech (Computer Science) || Gold Medalist (Physics) || Prof. at BBD Group of Institutions"
    },
    {
      "id": "304",
      "name": "Aman Singh",
      "profilePhoto":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4ycQKueb-YzYMcMAF4OSsZMF-xEHlw_2SWTICYJfaPYmEK1rH_mnLybkif0qO996aQII&usqp=CAU",
      "department": "Mechanical",
      "followers": 104,
      "bio":
          "M.tech (Computer Science) || Gold Medalist (Physics) || Prof. at BBD Group of Institutions"
    }
  ];
}

Future<File?> urlToFile(String imageUrl) async {
  File? file;
  try {
    var ff = "subject";
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    file = File('$tempPath/$ff.pdf');
    http.Response response = await http.get(Uri.parse(imageUrl));
    await file.writeAsBytes(response.bodyBytes);
  } catch (e) {
    print(e);
  }
  return file;
}
