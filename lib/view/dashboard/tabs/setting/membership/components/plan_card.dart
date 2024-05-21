//
// Created by 1 More Code on 20/05/24.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final dynamic plan;

  const PlanCard({super.key, this.plan});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 14),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  colors: plan['colors'],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 70,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: plan['colors'][0],
                    borderRadius: BorderRadius.circular(6)),
                alignment: Alignment.center,
                child: Text(
                  plan['duration_name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${plan['plan_name']}",
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                " ${plan['active'] ? '(Active)' : ''}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          )),
                      Text(
                        "₹${plan['price']}",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Text(
                    plan['plan_type'],
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    plan['benefits'],
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ))
            ],
          ),
        ),
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
              color: plan['colors'][1],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2)),
          child: Icon(
            plan['active'] ? CupertinoIcons.checkmark_seal_fill : CupertinoIcons.right_chevron,
            size: 16,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
