import 'package:elearning/view/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  static TextEditingController nameController = TextEditingController();
  static TextEditingController universityController = TextEditingController();
  static TextEditingController instituteController = TextEditingController();
  static TextEditingController courseController = TextEditingController();
  static TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        children: [
          const Text(
            "Basic Details",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Full Name",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
          SizedBox(
            height: 50,
            child: CupertinoTextField(
              controller: nameController,
              placeholder: "Enter Full Name",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "University",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
          SizedBox(
            height: 50,
            child: CupertinoTextField(
              controller: universityController,
              placeholder: "Enter University",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Institute",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
          SizedBox(
            height: 50,
            child: CupertinoTextField(
              controller: instituteController,
              placeholder: "Enter Institute",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Course",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: CupertinoTextField(
                        controller: courseController,
                        placeholder: "Enter Course",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Year",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: CupertinoTextField(
                        controller: yearController,
                        placeholder: "Enter Year",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  if (checkValidation()) {
                    print("Is Valid");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                        (route) => false);
                  } else {
                    print("Is Invalid");
                  }
                },
                height: 45,
                elevation: 1,
                color: Colors.blue,
                disabledColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }

  bool checkValidation() {
    if (nameController.text.isEmpty) {
      print("Enter a valid Name");
      return false;
    } else if (universityController.text.isEmpty) {
      print("Enter a valid University");
      return false;
    } else if (instituteController.text.isEmpty) {
      print("Enter a valid Institute");
      return false;
    } else if (courseController.text.isEmpty) {
      print("Enter a valid Course");
      return false;
    } else if (yearController.text.isEmpty) {
      print("Enter a valid Year");
      return false;
    } else {
      return true;
    }
  }
}
