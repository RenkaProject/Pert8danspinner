import 'package:flutter/material.dart';

class Pertemuan4ToastAlert extends StatelessWidget {
  Pertemuan4ToastAlert({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Ini adalah Toast / SnackBar"),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Alert"),
        content: const Text("Ini adalah Alert Dialog"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showSnackBar(context),
              child: const Text("Tampilkan Toast"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => showAlertDialog(context),
              child: const Text("Tampilkan Alert"),
            ),
          ],
        ),
      ),
    );
  }
}