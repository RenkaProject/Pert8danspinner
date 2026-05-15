import 'package:flutter/material.dart';
import 'autocomplete.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Widget> pages = [
    const ProfilePage(),
    const AutocompletePage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER IMAGE
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1504805572947-34fad45aed93?q=80&w=1470&auto=format&fit=crop',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: Align(
                    alignment: const Alignment(0.0, 2.5),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1725653811863-8ca1776e126a?q=80&w=1528&auto=format&fit=crop',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 70),

              // NAME
              const Text(
                "Jhon Doe",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blueGrey,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // LOCATION
              const Text(
                "Jakarta, Indonesia",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 10),

              // JOB
              const Text(
                "Flutter Software Engineer",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 25),

              // CARD STATS
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      buildStatColumn("Project", "16"),
                      buildDivider(),
                      buildStatColumn("Followers", "2308"),
                      buildDivider(),
                      buildStatColumn("Following", "120"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // BUTTON
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AutocompletePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text(
                  "View More",
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildDivider() {
    return Container(
      height: 50,
      width: 1,
      color: Colors.grey.shade300,
    );
  }
}
