import 'package:flutter/material.dart';
import 'package:mydj/pages/startup_page.dart';
import 'package:provider/provider.dart';
import 'data/data_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MyDj(),
    ),
  );
}

class MyDj extends StatelessWidget {
  const MyDj({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDJ - Jurnal Harian Guru',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const StartupPage(),
    );
  }
}