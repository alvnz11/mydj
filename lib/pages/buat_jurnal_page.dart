import 'package:flutter/material.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/data/jurnal.dart';
import 'package:provider/provider.dart';

class BuatJurnalPage extends StatefulWidget {
  const BuatJurnalPage({super.key, required this.title});
  final String title;

  @override
  State<BuatJurnalPage> createState() {
    return _BuatJurnalPageState();
  }
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
  String kelas = '';
  String mapel = '';
  int jamKe = 0;
  String tujuanPembelajaran = '';
  String materiTopikPembelajaran = '';
  String kegiatanPembelajaran = '';
  String dimensiProfilPelajarPancasila = '';

  void _saveJurnal(BuildContext context){
    Jurnal jurnal = Jurnal(
      kelas: kelas,
      mapel: mapel,
      jam: jamKe,
      tujuanPembelajaran: tujuanPembelajaran,
      materiTopikPembelajaran: materiTopikPembelajaran,
      kegiatanPembelajaran: kegiatanPembelajaran,
      dimensiProfilPelajarPancasila: dimensiProfilPelajarPancasila,
    );
    DataProvider provider = context.read<DataProvider>();
    provider.addNew(jurnal);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Berhasil!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Data jurnal berhasil disimpan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _textArea(String label, String hint, void Function(String text) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: hint,
          ),
          maxLines: 4,
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Kelas
              Text('Kelas:'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan kelas',
                ),
                onChanged: (value) => {setState(() {
                  kelas = value; 
                })},
              ),

              SizedBox(height: 10),

              // Input Nama Mapel
              Text('Nama Mapel:'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Nama Mapel',
                ),
                onChanged: (value) => {setState(() {
                  mapel = value; 
                })},
              ),

              SizedBox(height: 10),

              // Input jam
              Text('Jam Ke-'),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pilih Jam',
                ),
                items: [
                  DropdownMenuItem(value: '1', child: Text('1')),
                  DropdownMenuItem(value: '2', child: Text('2')),
                  DropdownMenuItem(value: '3', child: Text('3')),
                  DropdownMenuItem(value: '4', child: Text('4')),
                  DropdownMenuItem(value: '5', child: Text('5')),
                  DropdownMenuItem(value: '6', child: Text('6')),
                  DropdownMenuItem(value: '7', child: Text('7')),
                  DropdownMenuItem(value: '8', child: Text('8')),
                ],
                onChanged: (value) => {setState(() {
                  jamKe = value != null ? int.parse(value) : 0;
                })},
              ),

              SizedBox(height: 10),

              // Input tujuan pembelajaran
              _textArea('Tujuan Pembelajaran:', 'Masukkan Tujuan Pembelajaran', (text) {tujuanPembelajaran = text;}),

              SizedBox(height: 10),

              // Input materi/topik pembelajaran
              _textArea('Materi/Topik Pembelajaran', 'Masukkan Materi/Topik Pembelajaran', (text) {materiTopikPembelajaran = text;}),

              SizedBox(height: 10),

              // Input kegiatan pembelajaran
              _textArea('Kegiatan Pembelajaran', 'Masukkan Kegiatan Pembelajaran', (text) {kegiatanPembelajaran = text;}),

              SizedBox(height: 10),

              // Input dimensi profil pelajar pancasila
              _textArea('Dimensi Profil Pelajar Pancasila', 'Tuliskan Dimensi Profil Pelajar Pancasila', (text) {dimensiProfilPelajarPancasila = text;}),

              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  onPressed: () => {_saveJurnal(context)},
                  label: Text("Simpan", style: TextStyle(color: Colors.black)),
                  icon: Icon(Icons.save, color: Colors.black),
                ),
              ),
              // ElevatedButton(onPressed: () => {}, child: Text("Simpan")),
            ],
          ),
        )
      )
    );
  }
}