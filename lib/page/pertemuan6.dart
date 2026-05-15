import 'package:flutter/material.dart';

class Pertemuan6Checkbox extends StatefulWidget {
  const Pertemuan6Checkbox({super.key});

  @override
  State<Pertemuan6Checkbox> createState() =>
      _Pertemuan6CheckboxState();
}

class _Pertemuan6CheckboxState
    extends State<Pertemuan6Checkbox> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 6"),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: const Text("Pilihan 1"),
            value: isChecked1,
            onChanged: (val) {
              setState(() {
                isChecked1 = val ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Pilihan 2"),
            value: isChecked2,
            onChanged: (val) {
              setState(() {
                isChecked2 = val ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}