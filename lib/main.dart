
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshop/consts/colors.dart';
import 'package:newshop/consts/styeles.dart';
import 'package:newshop/viwes/splach_Screen/splach.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions
    (
      apiKey: 'AIzaSyB_lEO3KWAh4lqNbMZ9HrHup0pwKGHJMqw', 
      appId: '1:103765634654:android:7ec973b6666f09d016cecf', 
      messagingSenderId: '103765634654',
       projectId: 'shop-f8b65')
  ): await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: darkFontGrey,
            ),
            backgroundColor: Colors.transparent,
          ),
          fontFamily: regular),
      home: SplachScreen(),
    );
  }
}
