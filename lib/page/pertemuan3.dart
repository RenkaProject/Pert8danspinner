import 'package:flutter/material.dart';

class Pertemuan3WidgetButton extends StatelessWidget {
  Pertemuan3WidgetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 3"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Klik Saya"),
        ),
      ),
    );
  }
}