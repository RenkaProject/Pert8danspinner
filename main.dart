import 'package:flutter/material.dart';
import 'page/autocomplete.dart';
import 'page/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> pages = [
    const ProfilePage(),
    const AutocompletePage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Scaffold(
        body: pages[currentPage],

        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,

          onTap: (i) {
            setState(() {
              currentPage = i;
            });
          },

          items: [
            // PROFILE
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.blue,
            ),

            // SEARCH
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
