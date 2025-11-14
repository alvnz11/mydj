import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';
import 'package:mydj/pages/login_page.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key, required this.title});
  final String title;

  @override
  State<AkunPage> createState() {
    return _AkunPageState();
  }
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ganti Sandi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2),
                SizedBox(height: 10),
                PasswordField(judul: "Sandi Lama"),
                SizedBox(height: 20),
                PasswordField(judul: "Sandi Baru"),
                SizedBox(height: 20),
                PasswordField(judul: "Konfirmasi Sandi Baru"),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    onPressed: () => {},
                    label: Text("Simpan", style: TextStyle(color: Colors.black)),
                    icon: Icon(Icons.save, color: Colors.black),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Keluar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => {_keluar()},
                    icon: Icon(Icons.logout_outlined, color: Colors.black),
                    label: Text("Keluar", style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
        ),
      )
    );
  }

  void _keluar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage()
      ),
    );
  }
}