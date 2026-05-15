import 'package:flutter/material.dart';

class Pertemuan5ListView extends StatelessWidget {
  const Pertemuan5ListView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(
      20,
      (i) => "Item ${i + 1}",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 5"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}