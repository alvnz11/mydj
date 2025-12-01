class Jurnal {
  final DateTime _createdAt;
  String kelas;
  String mapel;
  int jam;
  String tujuanPembelajaran;
  String materiTopikPembelajaran;
  String kegiatanPembelajaran;
  String dimensiProfilPelajarPancasila;
  String fotoKegiatanPath = '';
  String videoKegiatanPath = '';

  Jurnal({
    this.kelas = '',
    this.mapel = '',
    this.jam = 0,
    this.tujuanPembelajaran = '',
    this.materiTopikPembelajaran = '',
    this.kegiatanPembelajaran = '',
    this.dimensiProfilPelajarPancasila = '',
    this.fotoKegiatanPath = '',
    this.videoKegiatanPath = '',
  }) : _createdAt = DateTime.now();

  DateTime get createdAt => _createdAt;
}