import 'package:elearning/config/assets.dart';
import 'package:elearning/view/dashboard/tabs/community/community_tab.dart';
import 'package:elearning/view/dashboard/tabs/download/download_tab.dart';
import 'package:elearning/view/dashboard/tabs/home/home_tab.dart';
import 'package:elearning/view/dashboard/tabs/search/search_tab.dart';
import 'package:elearning/view/dashboard/tabs/setting/setting_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List<Widget> bodyList = const [
    HomeTab(),
    DownloadTab(),
    SearchTab(),
    CommunityTab(),
    SettingTab()
  ];

  List<Widget> appbarTitles = [
    Image.asset(hrLogo, height: 40,),
    Text("Download"),
    Text("Search"),
    Text("Community"),
    Text("Setting"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTitles[currentIndex],
      ),
      body: bodyList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_alt),
            activeIcon: Icon(CupertinoIcons.house_alt_fill),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            activeIcon: Icon(Icons.download_for_offline),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search_circle),
            activeIcon: Icon(CupertinoIcons.search_circle_fill),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_text),
            activeIcon: Icon(CupertinoIcons.doc_chart_fill),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            activeIcon: Icon(CupertinoIcons.settings_solid),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
