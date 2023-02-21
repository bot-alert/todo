import 'package:flutter/material.dart';
import 'package:ashish_flutter/page/home_page.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  //initialize the hiveDB
  await Hive.initFlutter();
  //open a box
  await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TO DO LIST",
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green)),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
