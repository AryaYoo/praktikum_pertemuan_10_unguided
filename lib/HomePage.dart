import 'package:flutter/material.dart';
import 'package:flutter_application_1/DaftarTugasPage.dart';
import 'package:flutter_application_1/SharedPreferencesServices.dart';
import 'package:flutter_application_1/TambahTugasPage.dart';
import 'package:flutter_application_1/TugasModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  List<Tugas> daftarTugas = [];

  @override
  void initState() {
    super.initState();
    loadTugas();
  }

  void loadTugas() async {
    List<Tugas> tugas = await sharedPreferencesService.getTugas();
    setState(() {
      daftarTugas = tugas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text('Gudang POS Surabaya, Wiyung'),
        leading: Image.network(
        "https://logos-download.com/wp-content/uploads/2019/07/PT_Pos_Indonesia_Logo.png",
        width: 200.0,
        ),
      ),
      body: DaftarTugasPage(daftarTugas, onDelete: deleteTugas),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TambahTugasPage(onSubmit: addTugas)),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }

  void addTugas(Tugas tugas) async {
    await sharedPreferencesService.addTugas(tugas);
    loadTugas();
  }

  void deleteTugas(int index) async {
    await sharedPreferencesService.deleteTugas(index);
    loadTugas();
  }
}
