import 'package:shared_preferences/shared_preferences.dart';

class LoginInfo {
  String username;
  String password;
  bool isLoggedIn;
  // LoginInfo(this.username, this.password, this.isLoggedIn);

  LoginInfo({
    this.username = '',
    this.password = '',
    this.isLoggedIn = false,
  });

  Future<void> saveToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<LoginInfo> loadFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    String password = prefs.getString('password') ?? '';
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    return LoginInfo(
      username: username,
      password: password,
      isLoggedIn: isLoggedIn,
    );
  }

  static Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    await prefs.remove('isLoggedIn');
  }

  @override 
  String toString() {
    return 'LoginInfo{username: $username, password: $password, isLoggedIn: $isLoggedIn}';
  }
}