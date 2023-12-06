import 'package:flutter/material.dart';
import 'package:flutter_application_1/TugasModel.dart';

class TambahTugasPage extends StatelessWidget {
  final Function(Tugas) onSubmit;

  TambahTugasPage({required this.onSubmit});

  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Barang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _judulController,
              decoration: InputDecoration(labelText: 'Nama Barang'),
            ),
            TextField(
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: 'Kategori'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Tugas tugas =
                    Tugas(_judulController.text, _deskripsiController.text);
                onSubmit(tugas);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber, // Ganti dengan warna yang diinginkan
              ),
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
