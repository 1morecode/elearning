//*************   © Copyrighted by 1 More Code. *********************

import 'package:elearning/config/assets.dart';
import 'package:elearning/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "",
            body: "",
            image: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image.asset(
                onBoard1,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            footer: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Platform that Empower Student Success",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          PageViewModel(
            title: "",
            body: "",
            footer: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Platform that Empower Student Success",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            image: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                onBoard2,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          PageViewModel(
            title: "",
            body: "",
            image: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image.asset(
                onBoard3,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            footer: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Platform that Empower Student Success",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          PageViewModel(
            title: "",
            body: "",
            footer: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Platform that Empower Student Success",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            image: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                onBoard4,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          )
        ],
        showNextButton: true,
        dotsDecorator: DotsDecorator(
            activeSize: const Size(8, 8),
            size: const Size(8, 8),
            color: Colors.grey.withOpacity(0.3),
            activeColor: Colors.blue),
        next: Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4)),
          alignment: Alignment.center,
          child: const Text("Next"),
        ),
        showBackButton: true,
        back: Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4)),
          alignment: Alignment.center,
          child: const Text("Prev"),
        ),
        done: Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4)),
          alignment: Alignment.center,
          child: const Text("Done"),
        ),
        onDone: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false);
        },
      ),
    );
  }
}
