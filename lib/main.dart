
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ohm_color_2/deget3_4.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: F,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      highContrastTheme: ThemeData.light(),
      highContrastDarkTheme: ThemeData.dark(),
      home: const OhmCalculator(),
    );
  }
}




