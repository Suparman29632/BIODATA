import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AppForm extends StatefulWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nisController,
      namaController,
      tpController,
      tgController,
      kelaminController,
      agamaController,
      alamatController;

  AppForm(
      {required this.formkey,
        required this.nisController,
        required this.namaController,
        required this.agamaController,
        required this.alamatController,
        required this.kelaminController,
        required this.tgController,
        required this.tpController});

  AppFormState createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  late String _kelamin, _agama, _alamat;
  final _status = ["Laki-laki", "Perempuan"];
  final List<String> items = [
    "",
    "Islam",
    "Katolik",
    "Protestan",
    "Hindu",
    "Budha",
    "Khonghucu",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: widget.formkey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          txtNis(),
          SizedBox(height: 16),
          txtNama(),
          SizedBox(height: 16),
          txtTempat(),
          SizedBox(height: 16),
          txtTanggal(),
          SizedBox(height: 16),
          tbKelamin(),
          SizedBox(height: 16),
          tbAgama(),
          SizedBox(height: 16),
          tbAlamat(),
        ],
      ),
    );
  }

  txtNis() {
    return TextFormField(
      controller: widget.nisController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "NIS",
          prefixIcon: Icon(Icons.card_membership),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukan NIS kelahiran anda';
        }
        return null;
      },
    );
  }

  txtNama() {
    return TextFormField(
      controller: widget.namaController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "NAMA",
          prefixIcon: Icon(Icons.note),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukan Nama Anda.';
        }
        return null;
      },
    );
  }

  txtTempat() {
    return TextFormField(
      controller: widget.tpController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "Tempat Lahir",
          prefixIcon: Icon(Icons.location_city),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukan Kota Lahir Anda.';
        }
        return null;
      },
    );
  }

  txtTanggal() {
    return TextFormField(
      readOnly: true,
      controller: widget.tgController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_today),
        labelText: 'Tanggal Lahir',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onTap: () async {
        await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 150),
            lastDate: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            )).then((tglahir) {
          if (tglahir != null) {
            widget.tgController.text = DateFormat('yyyy-MM-dd').format(tglahir);
          }
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukan Tanggal Lahir Anda.';
        }
        return null;
      },
    );
  }

  tbKelamin() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.social_distance),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      value: widget.kelaminController.text,
      hint: Text('Jenis Kelamin'),
      onChanged: (String? newValue) {
        setState(() {
          _kelamin = newValue!;
          widget.kelaminController.text = _kelamin;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Silakan Pilih Jenis Kelamin anda.';
        }
        return null;
      },
      items: _status.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  tbAgama() {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
          labelText: "Agama",
          prefixIcon: Icon(Icons.church),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      value: widget.agamaController.text,
      hint: const Text(
        'Pilih Agama',
        style: TextStyle(fontSize: 14),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
          ),
        ),
      ))
          .toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Pilih Agama.';
        }
        return null;
      },
      onChanged: (value) {
        _agama = value.toString();
        widget.agamaController.text = _agama;
      },
      onSaved: (value) {
        _agama = value.toString();
        widget.agamaController.text = _agama;
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  tbAlamat() {
    return TextFormField(
      controller: widget.alamatController,
      decoration: InputDecoration(
        labelText: 'Alamat',
        prefixIcon: Icon(Icons.location_on),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Silahkan Masukan Alamat anda.';
        }
        return null;
      },
      onSaved: (value) {
        _alamat = value!;
      },
    );
  }
}