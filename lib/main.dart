import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:poc_new_feature/src/home/home_page.dart';

void main() {
  timeDilation = 1.0;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(
          title: 'POC New Feature',
        ));
  }
}
