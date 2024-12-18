import 'package:flutter/material.dart';

import 'form_detail.dart';
import 'form_input.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
        title: Text('DATA WARGA'),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(
              Icons.add_box,
              size: 50,
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormInput()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0), // Memberikan padding di ListView
        children: [
          Card(
            elevation: 3.0, // Menambahkan elevasi untuk efek shadow
            margin: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 30), // Margin antar kartu
            child: ListTile(
              title: Text('Toni'),
              subtitle: Text('Polisi'),
              onTap: () {
                // Aksi ketika mengetuk kartu, misalnya menampilkan detail
              },
            ),
          ),
          Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
            child: ListTile(
              title: Text('Tino'),
              subtitle: Text('Dokter'),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
            child: ListTile(
              title: Text('Tono'),
              subtitle: Text('Kuli'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String? namaWarga;
  final String? profesiWarga;
  final String? genderWarga;

  const ItemProduk(
      {Key? key, this.namaWarga, this.profesiWarga, this.genderWarga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(namaWarga.toString()),
          subtitle: Text(profesiWarga.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormDetail(
                  namaWarga: namaWarga,
                  profesiWarga: profesiWarga,
                  genderWarga: genderWarga,
                )));
      },
    );
  }
}