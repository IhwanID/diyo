import 'package:diyo/view/home_page.dart';
import 'package:diyo/view/passcode_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DIYO",
      initialRoute: "/home",
      getPages: routes,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
               shape: const StadiumBorder(),
               minimumSize: const Size.fromHeight(50),
                ))),
    ),
  );
}

final routes = [
  GetPage(name: "/passcode", page: () => const PassCodePage()),
  GetPage(name: "/home", page: () => const HomePage())
];
