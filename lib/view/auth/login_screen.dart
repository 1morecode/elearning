//*************   © Copyrighted by 1 More Code. *********************

import 'package:elearning/config/assets.dart';
import 'package:elearning/view/auth/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset(loginImage)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const Text(
                  "We have to send you an OTP to verify your account.",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Mobile Number",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
                const CupertinoTextField(
                  placeholder: "Enter Mobile Number",
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPScreen(),));
                      },
                      height: 45,
                      elevation: 1,
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: const Text("Get OTP"),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                      "- OR -",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    )))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {},
                      height: 45,
                      color: Colors.white,
                      elevation: 1,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          Image.asset(
                            googleIcon,
                            height: 20,
                          ),
                          const Expanded(
                              child: Center(
                            child: Text(
                              "Continue with Google",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ))
                        ],
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'By Continue to agree our\n',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Terms',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("Terms Tapped");
                                    },
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500)),
                              const TextSpan(text: " & "),
                              TextSpan(
                                  text: 'Policy',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("Policy Tapped");
                                    },
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
