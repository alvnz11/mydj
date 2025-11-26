import 'package:flutter/material.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/pages/login_page.dart';
import 'package:mydj/pages/simple_home_page.dart';
import 'package:provider/provider.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();

}

class _StartupPageState extends  State<StartupPage> {
  bool _isLoggedin = false;

  @override
  Widget build(BuildContext context) {
    if (_isLoggedin == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return _isLoggedin! ? const SimpleHomePage(title: 'Beranda') : const LoginPage(); 
  }

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final DataProvider provider = context.read<DataProvider>();

    final bool isLoggedIn = await provider.isLoggedIn();

    if(!mounted) return;

    setState(() => _isLoggedin = isLoggedIn);
  }
}