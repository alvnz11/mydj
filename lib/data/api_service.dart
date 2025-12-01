import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'jurnal.dart';

class ApiService {
  static const String baseUrl = "http://192.168.100.8:8000";

  Future<void> uploadJurnal(Jurnal jurnal) async {
    final url = Uri.parse("$baseUrl/upload-jurnal");

    var request = http.MultipartRequest("POST", url);

    // kirim field teks
    request.fields['kelas'] = jurnal.kelas;
    request.fields['mapel'] = jurnal.mapel;
    request.fields['jam'] = jurnal.jam.toString();
    request.fields['tujuanPembelajaran'] = jurnal.tujuanPembelajaran;
    request.fields['materiTopikPembelajaran'] = jurnal.materiTopikPembelajaran;
    request.fields['kegiatanPembelajaran'] = jurnal.kegiatanPembelajaran;
    request.fields['dimensiProfilPelajarPancasila'] = jurnal.dimensiProfilPelajarPancasila;

    // createdAt sebagai ISO 8601 string
    request.fields['createdAt'] = jurnal.createdAt.toIso8601String();

    // kirim file foto jika ada
    if (jurnal.fotoKegiatanPath.isNotEmpty) {
      http.MultipartFile imageData = await http.MultipartFile.fromPath(
        'image',
        jurnal.fotoKegiatanPath,
        filename: File(jurnal.fotoKegiatanPath).uri.pathSegments.last,
      );
      request.files.add(imageData);
    }

    // kirim file video jika ada
    if (jurnal.videoKegiatanPath.isNotEmpty) {
      http.MultipartFile videoData = await http.MultipartFile.fromPath(
        'video',
        jurnal.videoKegiatanPath,
        filename: File(jurnal.videoKegiatanPath).uri.pathSegments.last,
      );
      request.files.add(videoData);
    }

    // kirim request
    http.StreamedResponse response = await request.send();

    // baca response -> String JSON
    String responseBody = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      throw Exception(
        "Gagal mengupload jurnal: ${response.statusCode}\n$responseBody",
      );
    } else {
      // Berhasil
      print("Jurnal berhasil diupload: $responseBody");
    }
  }
}