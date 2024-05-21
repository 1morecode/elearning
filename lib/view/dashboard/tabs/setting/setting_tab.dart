//
// Created by 1 More Code on 09/05/24.
//

import 'package:elearning/view/dashboard/tabs/setting/membership/membership_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.thelittlehawk.com/wp-content/uploads/2018/10/IMG-1246-900x675.jpg"),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Rahul Yadav",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "(B.Tech 3rd Year)",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Babu Banarasi Das Institute of Technology (AKTU)",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              CupertinoButton(
                  child: const Text("Edit Profile"), onPressed: () {}),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Membership"),
            ),
            settingListItem(
                title: 'VIP Membership', icon: CupertinoIcons.settings, onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MembershipScreen(),));
            }),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Appearance"),
            ),
            settingListItem(
              title: 'Dark Theme',
              icon: CupertinoIcons.sun_max,
              trailing: Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: isDarkTheme,
                    onChanged: (val) {
                      setState(() {
                        isDarkTheme = val;
                      });
                    },
                    activeColor: Colors.blue,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("More"),
            ),
            settingListItem(
                title: 'Privacy Policy', icon: CupertinoIcons.lock_shield),
            settingListItem(title: 'Get Support', icon: CupertinoIcons.phone),
            settingListItem(title: 'Share App', icon: Icons.telegram),
            settingListItem(
                title: 'Rate Us', icon: CupertinoIcons.star_lefthalf_fill),
            settingListItem(
                title: 'About App', icon: CupertinoIcons.info_circle_fill),
          ],
        )
      ],
    );
  }

  Widget settingListItem(
      {required String title, required IconData icon, Widget? trailing, Function? onTap}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.2), width: 1))),
      child: CupertinoButton(
        onPressed: trailing != null
            ? null
            : () {
                if(onTap != null){
                  onTap();
                }
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectScreen(subject: subject,),));
                // print("Subject Tapped");
              },
        padding: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                width: 10,
              ),
              if (trailing != null)
                trailing
              else
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                    size: 14,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
