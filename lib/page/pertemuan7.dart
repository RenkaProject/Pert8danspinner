import 'package:flutter/material.dart';

class Pertemuan7Radio extends StatefulWidget {
  const Pertemuan7Radio({super.key});

  @override
  State<Pertemuan7Radio> createState() =>
      _Pertemuan7RadioState();
}

class _Pertemuan7RadioState
    extends State<Pertemuan7Radio> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 7"),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            title: const Text("Pilihan A"),
            value: "A",
            groupValue: selectedValue,
            onChanged: (val) {
              setState(() {
                selectedValue = val;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text("Pilihan B"),
            value: "B",
            groupValue: selectedValue,
            onChanged: (val) {
              setState(() {
                selectedValue = val;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text("Pilihan C"),
            value: "C",
            groupValue: selectedValue,
            onChanged: (val) {
              setState(() {
                selectedValue = val;
              });
            },
          ),
        ],
      ),
    );
  }
}