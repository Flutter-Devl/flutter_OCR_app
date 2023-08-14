import 'package:flutter/material.dart';
import 'package:flutter_ocr_app/screens/home_screen.dart';
import 'package:flutter_ocr_app/screens/upload_screen.dart';
import 'package:flutter_ocr_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      color: Colors.white,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.uploadpage: (context) => const UploadPage(),
      },
    );
  }
}
