import 'package:flutter/material.dart';
import 'package:stor_app/screen/Update_page.dart';
import 'package:stor_app/screen/home_screen.dart';
import 'package:stor_app/servece/updat_product.dart';

void main() {
  runApp(const StorApp());
}

class StorApp extends StatelessWidget {
  const StorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        UpdatePage.id: (context) => UpdatePage(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
