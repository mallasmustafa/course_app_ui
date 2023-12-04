import 'package:flutter/material.dart';
import 'package:online_course_app/pages/root_app.dart';
import 'package:online_course_app/theme/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.appBgColor,
         primaryColor:AppColor. primary,
      ),
      home: const RootApp(),
    );
  }
}

