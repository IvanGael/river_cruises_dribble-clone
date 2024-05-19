import 'package:flutter/material.dart';
import 'package:river_cruises_dribble/constants/colors.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.help,
                      color: AppColors.primary,
                    ),
                    const Text(
                      "Help",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ))
            ],
          ),
          const SizedBox(
            height: 150,
          ),
          const Text("Help view"),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
