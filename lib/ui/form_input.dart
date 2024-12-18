import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'form_detail.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FormInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormInputState();
  }
}

class FormInputState extends State<FormInput> {
  final _namaWargaTextBoxController = TextEditingController();
  final _profesiWargaController = TextEditingController();
  final _tanggalLahirController = TextEditingController();

  String _genderWarga = "";
  final _status = ["Pria", "Wanita"];

  final List<String> items = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Budha',
    'Konghucu',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Warga'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize:
            MainAxisSize.min, // Agar ukuran kolom sesuai dengan konten
            children: [
              _textboxNamaWarga(),
              _textboxProfesiWarga(),
              _textboxGenderWarga(),
              _textboxAgamaWarga(),
              _textboxTanggalLahir(),
              const SizedBox(
                  height:
                  20.0), // Memberikan jarak antara input form dan tombol
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _textboxNamaWarga() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang
        borderRadius: BorderRadius.circular(10.0), // Membuat sudut melengkung
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Warna shadow
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Posisi shadow
          ),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Nama Warga",
          prefixIcon:
          Icon(Icons.person), // Menambahkan ikon di dalam input form
          border: InputBorder.none, // Menghilangkan border default
          contentPadding: EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 10.0), // Mengatur padding
        ),
        controller: _namaWargaTextBoxController,
      ),
    );
  }

  _textboxProfesiWarga() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang
        borderRadius: BorderRadius.circular(10.0), // Membuat sudut melengkung
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Warna shadow
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Posisi shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Profesi Warga",
          prefixIcon: Icon(Icons.work), // Menambahkan ikon di dalam input form
          border: InputBorder.none, // Menghilangkan border default
          contentPadding: EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 10.0), // Mengatur padding
        ),
        controller: _profesiWargaController,
      ),
    );
  }

  _textboxGenderWarga() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang
        borderRadius: BorderRadius.circular(10.0), // Membuat sudut melengkung
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Warna shadow
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Posisi shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
          vertical: 10.0, horizontal: 10.0), // Padding di dalam container
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start, // Menyusun teks dan radio button ke kiri
        children: [
          const Text(
            "Jenis Kelamin Warga", // Teks di atas radio button
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
              height: 10.0), // Memberikan jarak antara teks dan radio button
          RadioGroup<String>.builder(
            groupValue: _genderWarga,
            onChanged: (value) => setState(() {
              _genderWarga = value ?? '';
            }),
            items: _status,
            itemBuilder: (item) => RadioButtonBuilder(
              item,
              textPosition: RadioButtonTextPosition
                  .right, // Posisi teks di sebelah kanan radio button
            ),
            activeColor: Colors.purple, // Warna radio button saat aktif
            fillColor: Colors.purple, // Warna fill untuk radio button
          ),
        ],
      ),
    );
  }

  _textboxAgamaWarga() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang
        borderRadius: BorderRadius.circular(10.0), // Membuat sudut melengkung
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Warna shadow
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Posisi shadow
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Agama',
          prefixIcon: Icon(Icons.people), // Ikon di dalam input form
          border: InputBorder.none, // Menghilangkan border default
          contentPadding: EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 10.0), // Mengatur padding
        ),
        isExpanded: true, // Membuat dropdown sesuai lebar container
        items: items
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(fontSize: 14),
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
      ),
    );
  }

  _textboxTanggalLahir() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang
        borderRadius: BorderRadius.circular(10.0), // Membuat sudut melengkung
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Warna shadow
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Posisi shadow
          ),
        ],
      ),
      child: TextField(
        controller: _tanggalLahirController, // Controller untuk tanggal lahir
        decoration: InputDecoration(
          labelText: "Tanggal Lahir",
          prefixIcon: Icon(Icons.calendar_today,
              color: Colors.blueAccent), // Ikon kalender di dalam input form
          border: InputBorder.none, // Menghilangkan border default
          contentPadding: EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 10.0), // Mengatur padding
        ),
        readOnly: true, // Agar tidak bisa mengetik langsung
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );

          if (pickedDate != null) {
            setState(() {
              _tanggalLahirController.text =
              "${pickedDate.toLocal()}".split(' ')[0];
            });
          }
        },
      ),
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String namaWarga = _namaWargaTextBoxController.text;
        String profesiWarga = _profesiWargaController.text;
        String genderWarga = _genderWarga;
        String agamaWarga = selectedValue ?? 'Tidak Dipilih';
        String tanggalLahir = _tanggalLahirController.text;

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FormDetail(
              namaWarga: namaWarga,
              profesiWarga: profesiWarga,
              genderWarga: genderWarga,
              agamaWarga: agamaWarga,
              tanggalLahir: tanggalLahir,
            )));
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple, // Warna teks
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(10.0), // Membuat sudut tombol melengkung
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 30.0), // Padding di dalam tombol
        elevation: 5.0, // Efek shadow di bawah tombol
        shadowColor: Colors.grey.withOpacity(0.5), // Warna shadow
      ),
      child: const Text(
        'Simpan',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}