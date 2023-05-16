import 'package:flutter/material.dart';
import 'package:flutter_web/pages/login.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//HOW TO RUN THE WEB FLUTTER
//  - RUN the debug(f5) or 'flutter run -d chrome' if ur unable to do it

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
