import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:biodata/models/api.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

class TambahForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TambahFormState();
  }
}

class TambahFormState extends State<TambahForm> {
  final formkey = GlobalKey<FormState>();

  TextEditingController nisController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tpController = TextEditingController();
  TextEditingController tgController = TextEditingController();
  TextEditingController kelaminController = TextEditingController();
  TextEditingController agamaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  String? selectedAgama;
  String? selectedKelamin;

  final List<String> agamaList = [
    'Islam',
    'Katolik',
    'Protestan',
    'Hindu',
    'Budha',
    'Khonghucu'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        tgController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future createSw() async {
    return await http.post(
      Uri.parse(BaseUrl.tambah),
      body: {
        "nis": nisController.text,
        "nama": namaController.text,
        "tplahir": tpController.text,
        "tglahir": tgController.text,
        "kelamin": selectedKelamin,
        "agama": selectedAgama,
        "alamat": alamatController.text,
      },
    );
  }

  void _onConfirm(context) async {
    http.Response response = await createSw();
    final data = json.decode(response.body);
    if (data['success']) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Siswa"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              // Input field for NIS
              TextFormField(
                controller: nisController,
                decoration: InputDecoration(
                  labelText: 'NIS',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan NIS';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Input field for Nama
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Nama';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Input field for Tempat Lahir
              TextFormField(
                controller: tpController,
                decoration: InputDecoration(
                  labelText: 'Tempat Lahir',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Tempat Lahir';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Input field for Tanggal Lahir with Date Picker
              TextFormField(
                controller: tgController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir',
                  border: OutlineInputBorder(),
                ),
                readOnly: true, // Prevents direct input
                onTap: () async {
                  FocusScope.of(context)
                      .requestFocus(FocusNode()); // Hide the keyboard
                  await _selectDate(context); // Show date picker
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Tanggal Lahir';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Radio button for Kelamin (Gender)
              Text(
                "Jenis Kelamin",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              RadioListTile<String>(
                title: const Text('Laki-laki'),
                value: 'Laki-laki',
                groupValue: selectedKelamin,
                onChanged: (String? value) {
                  setState(() {
                    selectedKelamin = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Perempuan'),
                value: 'Perempuan',
                groupValue: selectedKelamin,
                onChanged: (String? value) {
                  setState(() {
                    selectedKelamin = value;
                  });
                },
              ),
              if (selectedKelamin == null)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Pilih Jenis Kelamin',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 16),

              // Dropdown for Agama
              DropdownButtonFormField<String>(
                value: selectedAgama,
                decoration: InputDecoration(
                  labelText: 'Agama',
                  border: OutlineInputBorder(),
                ),
                items: agamaList.map((String agama) {
                  return DropdownMenuItem<String>(
                    value: agama,
                    child: Text(agama),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedAgama = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih Agama';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Input field for Alamat
              TextFormField(
                controller: alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Alamat';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.blue,
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          onPressed: () {
            if (formkey.currentState!.validate()) {
              print("OK SUKSES");
              _onConfirm(context);
            }
          },
        ),
      ),
    );
  }
}