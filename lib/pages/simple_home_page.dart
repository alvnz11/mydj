import 'package:flutter/material.dart';
import 'package:mydj/pages/akun_page.dart';
import 'package:mydj/pages/buat_jurnal_page.dart';
import 'package:mydj/pages/lihat_jurnal_page.dart';
import 'package:mydj/pages/tentang_page.dart';

class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SimpleHomePageState();
  }
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false, // hilangkan tombol back
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_kemdikbud.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ()=>{_openLihatJurnalPage()}, child: Text('Lihat Jurnal')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: ()=>{_openBuatJurnalPage()}, child: Text('Buat Jurnal')),
              ]
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ()=>{_openAkunPage()}, child: Text('Akun')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: ()=>{_openTentangPage()}, child: Text('Tentang Aplikasi')),
              ],
            ),
          ],
        )
      )
    );
  }

  void _openLihatJurnalPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LihatJurnalPage(title: 'Lihat Jurnal')
      ),
    );
  }

  void _openBuatJurnalPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuatJurnalPage(title: 'Buat Jurnal')
      ),
    );
  }

  void _openAkunPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AkunPage(title: 'Akun')
      ),
    );
  }

  void _openTentangPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TentangPage(title: 'Tentang Aplikasi')
      ),
    );
  }
}