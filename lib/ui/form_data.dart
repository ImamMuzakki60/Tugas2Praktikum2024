import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  final VoidCallback toggleTheme;

  const FormData({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        actions: [
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(_namaController, "Nama", Icons.person),
            const SizedBox(height: 16),
            _buildTextField(_nimController, "NIM", Icons.numbers),
            const SizedBox(height: 16),
            _buildTextField(_tahunController, "Tahun Lahir", Icons.calendar_today),
            const SizedBox(height: 24),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton.icon(
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahun = int.parse(_tahunController.text);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TampilData(nama: nama, nim: nim, tahun: tahun),
        ));
      },
      icon: const Icon(Icons.save),
      label: const Text('Simpan'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}