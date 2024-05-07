import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const IntroButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onPressed();
      },
      borderRadius: BorderRadius.circular(4),
      color: Colors.grey.withOpacity(0.3),
      minSize: 25,
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
