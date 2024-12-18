import 'package:flutter/foundation.dart';

class SiswaModel {
  final int id;
  final String nis;
  final String nama;
  final String tplahir;
  final String tglahir;
  final String kelamin;
  final String agama;
  final String alamat;

  SiswaModel({
    required this.id,
    required this.nis,
    required this.nama,
    required this.tplahir,
    required this.tglahir,
    required this.kelamin,
    required this.agama,
    required this.alamat,
  });

  factory SiswaModel.fromJson(Map<String, dynamic> json) {
    // Add null checks and default values if necessary
    return SiswaModel(
      id: json['id'] ?? 0, // Default to 0 if id is not present
      nis: json['nis'] ?? '', // Default to empty string if name is not present
      nama: json['nama'] ?? '', // Default to empty string if name is not present
      tplahir: json['tplahir'] ?? '',
      tglahir: json['tglahir'] ?? '',
      kelamin: json['kelamin'] ?? '',
      agama: json['agama'] ?? '',
      alamat: json['alamat'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'nis': nis,
    'tplahir': tplahir,
    'tglahir': tglahir,
    'kelamin': kelamin,
    'agama': agama,
    'alamat': alamat,
  };
}