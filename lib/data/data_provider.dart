import 'package:mydj/data/jurnal.dart';
import 'package:flutter/cupertino.dart';
import 'package:mydj/data/login_info.dart';

class DataProvider extends ChangeNotifier {
  final List<Jurnal> _jurnalTersimpan = [];

  void addNew(Jurnal jurnal) {
    _jurnalTersimpan.add(jurnal);
    notifyListeners();
  }

  List<Jurnal> get jurnalTersimpan{
    return List.unmodifiable(_jurnalTersimpan);
  }
}