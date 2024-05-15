//
// Created by 1 More Code on 15/05/24.
//

import 'dart:io';

import 'package:download/download.dart';
import 'package:elearning/config/data.dart';
import 'package:elearning/model/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uri_to_file/uri_to_file.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(note.thumbnail), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(6)),
              child: Container(
                height: 100,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black.withOpacity(0.3)),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Text(note.unit,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Text(
                    "By ${note.writer}",
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${note.pages} Pages",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text("${note.views} Views",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          try {
                            launchUrl(Uri.parse(note.file));
                          } catch (e) {
                            print(e);
                          }
                        },
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        minSize: 30,
                        child: const Text(
                          "View",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          try {
                            Share.shareUri(Uri.parse(note.file));
                          } catch (e) {
                            print(e);
                          }
                        },
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        minSize: 30,
                        child: const Text(
                          "Share",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () async {
                          try {
                            File? file = await urlToFile(note.file);
                            if(file != null) {
                              print(file.path);
                              final stream =
                              Stream.fromIterable('Hello World!'.codeUnits);
                              download(stream, file.path);
                            }

                          } catch (e) {
                            print(e);
                          }
                        },
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        minSize: 30,
                        child: const Text(
                          "Download",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
