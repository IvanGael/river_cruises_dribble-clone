import 'package:flutter/material.dart';
import 'package:river_cruises_dribble/constants/colors.dart';

import 'ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: AppColors.primary
        ),
        fontFamily: "PetrovSans",
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}


