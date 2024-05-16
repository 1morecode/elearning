//
// Created by 1 More Code on 15/05/24.
//

import 'dart:io';

import 'package:download/download.dart';
import 'package:elearning/config/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../model/book_model.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

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
              height: 120,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(book.thumbnail), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(6)),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(
                        "Writer: ${book.writer}",
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        "By ${book.seller}",
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
                          Text("${book.pages} Pages",
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)),
                          Text("${book.views} Views",
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
                                launchUrl(Uri.parse(book.file));
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
                                Share.shareUri(Uri.parse(book.file));
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
                                File? file = await urlToFile(book.file);
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
