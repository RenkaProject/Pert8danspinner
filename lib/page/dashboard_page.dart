import 'package:flutter/material.dart';
import '../models/pertemuan.dart';

import 'pertemuan2.dart';
import 'pertemuan3.dart';
import 'pertemuan4.dart';
import 'pertemuan5.dart';
import 'pertemuan6.dart';
import 'pertemuan7.dart';
import 'pertemuan8.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Pertemuan> pertemuanList = [
      Pertemuan(
        title: "Pertemuan 2",
        page: Pertemuan2(),
      ),

      Pertemuan(
        title: "Pertemuan 3",
        page: Pertemuan3WidgetButton(),
      ),

      Pertemuan(
        title: "Pertemuan 4",
        page: Pertemuan4ToastAlert(),
      ),

      Pertemuan(
        title: "Pertemuan 5",
        page: Pertemuan5ListView(),
      ),

      Pertemuan(
        title: "Pertemuan 6",
        page: Pertemuan6Checkbox(),
      ),

      Pertemuan(
        title: "Pertemuan 7",
        page: Pertemuan7Radio(),
      ),

      // Pertemuan 8
      Pertemuan(
        title: "Pertemuan 8",
        page: const AutocompletespinPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),

        itemCount: pertemuanList.length,

        itemBuilder: (context, index) {
          final item = pertemuanList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => item.page,
                ),
              );
            },

            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.shade400,
                    Colors.purple.shade300,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                borderRadius:
                    BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.deepPurple.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Text(
                      "${index + 2}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}