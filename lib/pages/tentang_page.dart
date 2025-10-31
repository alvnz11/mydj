import 'package:flutter/material.dart';

class TentangPage extends StatefulWidget {
  const TentangPage({super.key, required this.title});
  final String title;

  @override
  State<TentangPage> createState() {
    return _LihatTentangPageState();
  }
}

class _LihatTentangPageState extends State<TentangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "MyDJ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Aplikasi Jurnal Harian Guru",
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              "Version : 0.1 (Beta)",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Dibuat oleh ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Alvanza Saputra Yudha",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "https://github.com/alvnz11",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      )
    );
  }
}