import 'package:flutter/material.dart';

class FormDetail extends StatefulWidget {
  @override
  final String? namaWarga;
  final String? profesiWarga;
  final String? genderWarga;
  final String? agamaWarga;
  final String? tanggalLahir;

  const FormDetail(
      {Key? key,
        this.namaWarga,
        this.profesiWarga,
        this.genderWarga,
        this.agamaWarga,
        this.tanggalLahir})
      : super(key: key);

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormDetailState();
  }
}

class FormDetailState extends State<FormDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Warga'),
        centerTitle: true,
        titleTextStyle:
        const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Align(
        alignment: Alignment.topCenter, // Menempatkan konten di tengah atas
        child: Card(
          elevation: 5.0, // Memberikan efek shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Sudut melengkung
          ),
          margin: const EdgeInsets.only(top: 20.0), // Jarak dari atas layar
          child: Padding(
            padding: const EdgeInsets.all(50.0), // Padding di dalam card
            child: Column(
              mainAxisSize:
              MainAxisSize.min, // Mengambil ruang minimum yang diperlukan
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama: ${widget.namaWarga}",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0), // Jarak antar teks
                Text(
                  "Profesi: ${widget.profesiWarga}",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Gender: ${widget.genderWarga}",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Agama: ${widget.agamaWarga}",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Tanggal Lahir: ${widget.tanggalLahir}",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}