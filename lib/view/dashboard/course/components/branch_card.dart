//
// Created by 1 More Code on 13/05/24.
//

import 'package:elearning/view/dashboard/course/branch/branch_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class BranchCard extends StatelessWidget {
//   const BranchCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class BranchCard extends StatefulWidget {
  final dynamic branch;
  const BranchCard({super.key, this.branch});

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => BranchScreen(branch: widget.branch,),));
        },
        padding: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Icon(widget.branch['icon'], color: Colors.black, size: 20,),
              ),
              const SizedBox(width: 10,),
              Expanded(
                  child: Text(
                    widget.branch['branch'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
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
