import 'package:flutter/material.dart';
import 'package:vnpass/life_circle_manager.dart';
import 'package:vnpass/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "BeVietNamPro",
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.greenApp,
          iconTheme: IconThemeData(color: AppTheme.white),
          titleTextStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white)
        )
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return LifeCircleManager();
  }
}
