//*************   © Copyrighted by 1 More Code. *********************

import 'package:elearning/config/assets.dart';
import 'package:elearning/view/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      print("Delay Completed");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen(),), (
              route) => false);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              mediumLogo,
              height: 160,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                "Platform that Empower Student’s Success",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
