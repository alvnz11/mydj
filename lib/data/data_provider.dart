import 'package:mydj/data/jurnal.dart';
import 'package:flutter/cupertino.dart';
import 'package:mydj/data/login_info.dart';

class DataProvider extends ChangeNotifier {
  final List<Jurnal> _jurnalTersimpan = [];

  DataProvider() {
    _addDefaultData();
  }

  void _addDefaultData() {
    _jurnalTersimpan.addAll([
      Jurnal(
        kelas: 'X IPA 1',
        mapel: 'Matematika',
        jam: 1,
        tujuanPembelajaran: 'Memahami konsep aljabar dasar dan menyelesaikan persamaan linear satu variabel',
        materiTopikPembelajaran: 'Persamaan Linear Satu Variabel',
        kegiatanPembelajaran: 'Ceramah interaktif, diskusi kelompok, dan latihan soal mandiri',
        dimensiProfilPelajarPancasila: 'Bernalar kritis',
      ),
      Jurnal(
        kelas: 'X IPA 2',
        mapel: 'Fisika',
        jam: 2,
        tujuanPembelajaran: 'Memahami hukum Newton I, II, dan III serta penerapannya dalam kehidupan sehari-hari',
        materiTopikPembelajaran: 'Hukum Newton tentang Gerak',
        kegiatanPembelajaran: 'Eksperimen praktikum, demonstrasi, dan analisis kasus',
        dimensiProfilPelajarPancasila: 'Kreatif',
      ),
      Jurnal(
        kelas: 'XI IPS 1',
        mapel: 'Sejarah',
        jam: 3,
        tujuanPembelajaran: 'Menganalisis peristiwa proklamasi kemerdekaan Indonesia dan nilai-nilai perjuangan',
        materiTopikPembelajaran: 'Proklamasi Kemerdekaan Indonesia',
        kegiatanPembelajaran: 'Presentasi multimedia, diskusi kelompok, dan studi dokumen sejarah',
        dimensiProfilPelajarPancasila: 'Beriman, bertakwa kepada Tuhan YME, dan berakhlak mulia',
      ),
      Jurnal(
        kelas: 'XII Bahasa',
        mapel: 'Bahasa Indonesia',
        jam: 4,
        tujuanPembelajaran: 'Menganalisis struktur dan kebahasaan teks prosedur serta mampu menulis teks prosedur yang baik',
        materiTopikPembelajaran: 'Teks Prosedur Kompleks',
        kegiatanPembelajaran: 'Analisis contoh teks, menulis kreatif, presentasi hasil karya',
        dimensiProfilPelajarPancasila: 'Bergotong royong',
      ),
      Jurnal(
        kelas: 'X IPA 3',
        mapel: 'Kimia',
        jam: 5,
        tujuanPembelajaran: 'Memahami struktur atom, konfigurasi elektron, dan sistem periodik unsur',
        materiTopikPembelajaran: 'Struktur Atom dan Tabel Periodik',
        kegiatanPembelajaran: 'Praktikum virtual, diskusi kelompok, presentasi hasil observasi',
        dimensiProfilPelajarPancasila: 'Bernalar kritis',
      ),
      Jurnal(
        kelas: 'XI IPA 2',
        mapel: 'Biologi',
        jam: 6,
        tujuanPembelajaran: 'Menganalisis sistem peredaran darah manusia dan gangguan yang mungkin terjadi',
        materiTopikPembelajaran: 'Sistem Kardiovaskular Manusia',
        kegiatanPembelajaran: 'Observasi model anatomi, diskusi kasus, presentasi kelompok',
        dimensiProfilPelajarPancasila: 'Mandiri',
      ),
      Jurnal(
        kelas: 'X IPS 1',
        mapel: 'Ekonomi',
        jam: 7,
        tujuanPembelajaran: 'Memahami konsep permintaan dan penawaran serta mekanisme pasar',
        materiTopikPembelajaran: 'Permintaan, Penawaran, dan Harga Pasar',
        kegiatanPembelajaran: 'Simulasi pasar, studi kasus, analisis grafik permintaan-penawaran',
        dimensiProfilPelajarPancasila: 'Bernalar kritis',
      ),
      Jurnal(
        kelas: 'XII IPA 1',
        mapel: 'Bahasa Inggris',
        jam: 8,
        tujuanPembelajaran: 'Menguasai penggunaan present perfect tense dalam percakapan dan tulisan',
        materiTopikPembelajaran: 'Present Perfect Tense',
        kegiatanPembelajaran: 'Role play, menulis diary, presentasi pengalaman pribadi',
        dimensiProfilPelajarPancasila: 'Berkebhinekaan global',
      ),
    ]);
  }

  void addNew(Jurnal jurnal) {
    _jurnalTersimpan.add(jurnal);
    notifyListeners();
  }

  List<Jurnal> get jurnalTersimpan{
    return List.unmodifiable(_jurnalTersimpan);
  }
}