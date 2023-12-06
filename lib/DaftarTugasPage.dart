import 'package:flutter/material.dart';
import 'package:flutter_application_1/TugasModel.dart';

class DaftarTugasPage extends StatelessWidget {
  final List<Tugas> daftarTugas;
  final Function(int) onDelete;

  DaftarTugasPage(this.daftarTugas, {required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 187, 187, 187),
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: daftarTugas.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0), // Tambahkan border radius di sini
            ),
          ),
          child: ListTile(
            title: Text(daftarTugas[index].judul),
            subtitle: Text(daftarTugas[index].deskripsi),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                onDelete(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
