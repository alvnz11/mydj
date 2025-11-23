import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';
import 'package:mydj/pages/simple_home_page.dart';

class LoginPage extends StatefulWidget {
  final String title = '';

  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String namaPengguna = '';
  String sandi = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/Logo.png', width: 250),
                Text(
                  "Log-In",
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username'),
                    SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      onChanged: (value) => {namaPengguna = value},
                    ),
                    SizedBox(height: 15),
                    PasswordField(judul: 'Password', onChanged: (value) => {sandi = value}),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.lightBlue,
                        ),
                        onPressed: () => {_openHomePage(context)},
                        icon: Icon(Icons.login, color: Colors.black),
                        label: Text("Login", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openHomePage(BuildContext context) {
    if (namaPengguna == 'guru' && sandi == 'guru') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Berhasil!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text('Login Berhasil!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimpleHomePage(title: 'Beranda')
                    ),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Gagal Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text('Username atau password salah. Silakan coba lagi.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}