//
// Created by 1 More Code on 09/05/24.
//

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:elearning/model/book_model.dart';
import 'package:elearning/model/lecture.dart';
import 'package:elearning/model/note_model.dart';
import 'package:elearning/model/pape.dart';
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

  static List<Book> booksList = [
    Book(
        id: "801",
        subjectId: "601",
        title: "Electronics & Communication (2021)",
        views: 234,
        file: "https://pages.uoregon.edu/rayfrey/DigitalNotes.pdf",
        pages: 12,
        thumbnail:
            "https://rukminim2.flixcart.com/image/850/1000/book/5/5/6/basic-electronics-solid-state-reprint-edn-2006-edition-original-imadwu85tdrgy2ft.jpeg?q=90&crop=false",
        seller: "UNIT 1",
        writer: "Ashish Kumar"),
    Book(
        id: "802",
        subjectId: "601",
        title: "Electronics & Communication (2022)",
        views: 234,
        file: "https://pages.uoregon.edu/rayfrey/DigitalNotes.pdf",
        pages: 12,
        thumbnail:
            "https://m.media-amazon.com/images/I/714sQ795nCS._AC_UF1000,1000_QL80_DpWeblab_.jpg",
        seller: "UNIT 2",
        writer: "Ashish Kumar"),
    Book(
        id: "803",
        subjectId: "601",
        title: "Electronics & Communication (2023)",
        views: 234,
        file: "https://pages.uoregon.edu/rayfrey/DigitalNotes.pdf",
        pages: 12,
        thumbnail:
            "https://m.media-amazon.com/images/I/41txu3s-PGL._SL500_.jpg",
        seller: "UNIT 3",
        writer: "Ashish Kumar")
  ];

  static List<Paper> papers = [
    Paper(
        subjectId: "601",
        answer:
            "https://www.aktuonline.com/btech/btech-oe-3-sem-digital-electronics-koe-039-2023.pdf",
        question:
            "https://www.aktuonline.com/btech/btech-cs-3-sem-computer-organization-and-architecture-kcs-302-2023.pdf",
        year: "2023"),
    Paper(
        subjectId: "601",
        answer:
            "https://www.aktuonline.com/btech/btech-oe-3-sem-digital-electronics-koe-039-2023.pdf",
        question:
            "https://www.aktuonline.com/btech/btech-cs-3-sem-discrete-structures-theory-of-logic-kcs-303-2023.pdf",
        year: "2022"),
    Paper(
        subjectId: "601",
        answer:
            "https://www.aktuonline.com/btech/btech-oe-3-sem-digital-electronics-koe-039-2023.pdf",
        question:
            "https://www.aktuonline.com/btech/btech-cs-3-sem-computer-organization-and-architecture-kcs-302-2023.pdf",
        year: "2021"),
    Paper(
        subjectId: "601",
        answer: "",
        question:
            "https://www.aktuonline.com/btech/btech-cs-3-sem-discrete-structures-theory-of-logic-kcs-303-2023.pdf",
        year: "2020"),
    Paper(
        subjectId: "601",
        answer:
            "https://www.aktuonline.com/btech/btech-oe-3-sem-digital-electronics-koe-039-2023.pdf",
        question:
            "https://www.aktuonline.com/btech/btech-cs-3-sem-computer-organization-and-architecture-kcs-302-2023.pdf",
        year: "2019"),
  ];

  static List<Lecture> lectures = [
    Lecture(
        heading: "Introduction",
        videos: [
          VideoModel(
              thumbnail:
                  "https://i.ytimg.com/vi/Vd2UJiIPbag/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAILcGSyDpy_qfAcdlYPPGPAI7UZg",
              views: "123",
              title: "Basic Electrical Engineering",
              creator: "Umesh Dhande",
              duration: const Duration(minutes: 40, seconds: 36),
              url:
                  "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4"),
        ],
        position: 1,
        subjectId: "601"),
    Lecture(
        heading: "Fundamentals",
        videos: [
          VideoModel(
              thumbnail:
                  "https://i.ytimg.com/vi/FjaJEo7knF4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCsSh_QrC4A2moKV_QIYSrnp67Dpw",
              views: "123",
              title: "DC Networks | Part 1 | OHM's Law & KVL (Lecture 01)",
              creator: "Umesh Dhande",
              duration: const Duration(minutes: 41, seconds: 31),
              url:
                  "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4"),
          VideoModel(
              thumbnail:
                  "https://i.ytimg.com/vi/LdMXFW3d_Mw/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBwkCgoCXRbE6izutZU76sA_0m0pg",
              views: "123",
              title:
                  "DC Networks | Part 2 | KVL | Question Type 2&3(Lecture 02)",
              creator: "Umesh Dhande",
              duration: const Duration(minutes: 41, seconds: 31),
              url:
                  "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"),
        ],
        position: 2,
        subjectId: "601"),
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
