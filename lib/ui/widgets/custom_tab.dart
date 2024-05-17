import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomTab extends StatefulWidget {
  final List<String> tabs;

  const CustomTab({super.key, required this.tabs});

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  int selectedIndex = 0;

  void onTabPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.greyShade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.tabs.asMap().entries.map((entry) {
            int index = entry.key;
            String label = entry.value;
            return Expanded(
                child: ElevatedButton(
              onPressed: () => onTabPressed(index),
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      selectedIndex == index
                          ? AppColors.primary
                          : AppColors.greyShade200),
                  shape: WidgetStateProperty.all(const StadiumBorder()),
                  foregroundColor: WidgetStateProperty.all(
                      selectedIndex == index
                          ? AppColors.white
                          : AppColors.black),
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 50)),
                  elevation: WidgetStateProperty.all(0)),
              child: Text(label),
            ));
          }).toList()),
    );
  }
}
