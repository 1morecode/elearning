//
// Created by 1 More Code on 16/05/24.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnswerCard extends StatelessWidget {
  final String url;
  const AnswerCard({super.key, required this.url});

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
          launchUrl(Uri.parse(url));
          print("Answer Tapped");
        },
        padding: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: const Icon(CupertinoIcons.question, color: Colors.black, size: 20,),
              ),
              const SizedBox(width: 10,),
              const Expanded(
                  child: Text(
                    "Solution Paper",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(width: 10,),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: const Icon(CupertinoIcons.right_chevron, color: Colors.black, size: 14,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


