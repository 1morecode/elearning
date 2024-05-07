import 'package:elearning/view/auth/login_screen.dart';
import 'package:elearning/view/onboarding/components/intro_button.dart';
import 'package:elearning/view/onboarding/components/intro_page.dart';
import 'package:flutter/material.dart';

import '../../config/assets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  List<dynamic> introData = [
    {"content": "Platform that Empower Student Success", "image": onBoard1},
    {"content": "Platform that Empower Student Success", "image": onBoard2},
    {"content": "Platform that Empower Student Success", "image": onBoard3},
    {"content": "Platform that Empower Student Success", "image": onBoard4}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              print("Current Index $index");
              setState(() {
                currentIndex = index;
              });
            },
            children: List.generate(introData.length,
                (index) => IntroPage(intro: introData[index])),
          ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentIndex != 0
                        ? IntroButton(
                            text: "Prev",
                            onPressed: () {
                              pageController.jumpToPage(currentIndex - 1);
                            })
                        : IntroButton(
                            text: "Skip",
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false);
                            }),
                    pageIndicator(),
                    currentIndex == 3
                        ? IntroButton(
                            text: "Done",
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false);
                            })
                        : IntroButton(
                            text: "Next",
                            onPressed: () {
                              pageController.jumpToPage(currentIndex + 1);
                            })
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  pageIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          introData.length,
          (index) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 6,
                  width: 16,
                  decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Colors.blue
                          : Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16)),
                ),
              )),
    );
  }
}
