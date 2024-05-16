//
// Created by 1 More Code on 16/05/24.
//

import 'package:elearning/model/lecture.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final VideoModel videoModel;

  const VideoCard({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1))
      ),
      child: Card(
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
                height: MediaQuery.of(context).size.width * 0.25 / 1.5,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(videoModel.thumbnail),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(6)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoModel.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "By: ${videoModel.creator}",
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
                        Text("${videoModel.views} Views",
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                        Text(videoModel.duration.toString().split('.')[0],
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
