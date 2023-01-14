import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_complete/view/home_screen.dart';
import 'package:mvvm_complete/view_model/home_screen_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => Homenotifier()),
      child: GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
