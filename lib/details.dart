import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:biodata/models/api.dart';
import 'package:biodata/models/msiswa.dart';
import 'package:biodata/edit.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class Details extends StatefulWidget {
  final SiswaModel sw;
  Details({required this.sw});

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  void deleteSiswa(context) async {
    http.Response response = await http.post(
      Uri.parse(BaseUrl.hapus),
      body: {
        'id': widget.sw.id.toString(),
      },
    );
    final data = json.decode(response.body);
    if (data['success']) {
      pesan();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
  }

  pesan() {
    Fluttertoast.showToast(
        msg: "Data berhasil dihapus :v",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void confirmDelete(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Yakin mau dihapus?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Icon(Icons.cancel),
              ),
              ElevatedButton(
                onPressed: () => deleteSiswa(context),
                child: Icon(Icons.check_circle),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Siswa'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => confirmDelete(context),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID : ${widget.sw.id}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "NIS : ${widget.sw.nis}",
              style: TextStyle(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "NAMA : ${widget.sw.nama}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "TEMPAT LAHIR : ${widget.sw.tplahir}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "TANGGAL LAHIR : ${widget.sw.tglahir}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "KELAMIN : ${widget.sw.kelamin}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "AGAMA : ${widget.sw.agama}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "ALAMAT : ${widget.sw.alamat}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Edit(sw: widget.sw),
          ),
        ),
      ),
    );
  }
}