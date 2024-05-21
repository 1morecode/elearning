//
// Created by 1 More Code on 20/05/24.
//

import 'package:elearning/config/data.dart';
import 'package:elearning/view/dashboard/tabs/setting/membership/components/plan_card.dart';
import 'package:flutter/material.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memberships"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => PlanCard(
          plan: UniData.planList[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemCount: UniData.planList.length,
      ),
    );
  }
}
