import 'package:elearning/view/auth/registration_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../config/assets.dart';

class OTPScreen extends StatefulWidget {
  final String mobile;

  const OTPScreen({super.key, required this.mobile});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  static String otp = '';

  static bool isOTPValidated = false;

  static dynamic defaultPinTheme = PinTheme(
    height: 50,
    width: 50,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(6),
    ),
  );

  static dynamic focusedPinTheme = PinTheme(
    height: 50,
    width: 50,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(6),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Image.asset(otpImage)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Verify OTP",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Verification code has been sent to your mobile ',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                              text: '+91 ${widget.mobile}',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Terms Tapped");
                                },
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500)),
                          const TextSpan(text: ". Enter below to verify."),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Enter OTP Code",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                    Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      length: 6,
                      validator: (otp) {
                        if (otp == '123456') {
                          setState(() {
                            isOTPValidated = true;
                          });
                          return null;
                        } else {
                          setState(() {
                            isOTPValidated = false;
                          });
                          return "Please enter a valid OTP.";
                        }
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) {
                        print(pin);
                        setState(() {
                          otp = pin;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MaterialButton(
                          onPressed: isOTPValidated
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationScreen(),
                                      ));
                                }
                              : null,
                          height: 45,
                          elevation: 1,
                          color: Colors.blue,
                          disabledColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            "Verify OTP",
                            style: TextStyle(
                                color: isOTPValidated
                                    ? Colors.white
                                    : Colors.white60),
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
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: BackButton(),
          )
        ],
      ),
    );
  }
}
