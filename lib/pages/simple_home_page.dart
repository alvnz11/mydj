import 'package:flutter/material.dart';
import 'package:mydj/pages/akun_page.dart';
import 'package:mydj/pages/buat_jurnal_page.dart';
import 'package:mydj/pages/lihat_jurnal_page.dart';
import 'package:mydj/pages/tentang_page.dart';
import 'package:provider/provider.dart';
import '../data/data_provider.dart';
import '../data/jurnal.dart';

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
    final List<Jurnal> daftarJurnal = context.watch<DataProvider>().jurnalTersimpan;
    // sort jurnal supaya yang terbaru di atas
    final sortedJurnal = List<Jurnal>.from(daftarJurnal)..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false, // buat hilangkan tombol back
        centerTitle: true,
        title: Text(widget.title),
        // Kalo mau di kiri
        // leading: IconButton(
        //   icon: Icon(Icons.info),
        //   onPressed: () {
        //     _openTentangPage();
        //   },
        // ),
        // Kalo mau di kanan
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              _openTentangPage();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Logo
              Image.asset(
                'assets/images/Logo.png',
                width: 200,
                height: 200,
              ),

              // Spacer(),
              SizedBox(height: 20),

              // Jurnal Terbaru 
              Container(
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Jurnal Terbaru',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                          leading: Icon(Icons.book),
                          title: Text(sortedJurnal[index].kelas),
                          subtitle: Text(sortedJurnal[index].mapel),
                          trailing: Text(sortedJurnal[index].createdAt.toString()),
                          onTap: () => {},
                        ),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: 5,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                        ),
                        onPressed: () => {_openLihatJurnalPage()},
                        label: Text("Lihat Selengkapnya", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                )
              ),

              Spacer(),
              // SizedBox(height: 160),

              // Navbar
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  child: NavigationBar(
                    // selectedIndex: 0,
                    onDestinationSelected: (index) {
                      if (index == 0) _openLihatJurnalPage();
                      else if (index == 1) _openBuatJurnalPage();
                      else if (index == 2) _openAkunPage();
                    },
                    backgroundColor: Theme.of(context).colorScheme.inversePrimary, 
                    destinations: [
                      NavigationDestination(
                        icon: Icon(Icons.list_alt),
                        label: 'Lihat Jurnal',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.add),
                        label: 'Buat Jurnal',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.account_circle),
                        label: 'Akun',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
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