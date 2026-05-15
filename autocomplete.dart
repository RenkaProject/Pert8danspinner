import 'package:flutter/material.dart';
import 'profile_page.dart';

enum ButtonState { init, loading, done }

class AutocompletePage extends StatefulWidget {
  const AutocompletePage({super.key});

  @override
  State<AutocompletePage> createState() => _AutocompletePageState();
}

class _AutocompletePageState extends State<AutocompletePage> {
  final List<Widget> pages = [
    const ProfilePage(),
    const AutocompletePage(),
  ];

  bool isAnimating = true;
  ButtonState state = ButtonState.init;

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final isDone = state == ButtonState.done;
    final isStretched =
        isAnimating || state == ButtonState.init;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 8"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearch(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width:
                state == ButtonState.init ? width : 70,
            onEnd: () {
              setState(() {
                isAnimating = !isAnimating;
              });
            },
            height: 70,
            child: isStretched
                ? buildButton()
                : buildSmallButton(isDone),
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 2,
          color: Colors.indigo,
        ),
        shape: const StadiumBorder(),
      ),
      onPressed: () async {
        setState(() {
          state = ButtonState.loading;
        });

        await Future.delayed(
          const Duration(seconds: 3),
        );

        setState(() {
          state = ButtonState.done;
        });

        await Future.delayed(
          const Duration(seconds: 3),
        );

        setState(() {
          state = ButtonState.init;
        });
      },
      child: const Text(
        'Submit',
        style: TextStyle(
          fontSize: 24,
          color: Colors.indigo,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildSmallButton(bool isDone) {
    final color =
        isDone ? Colors.green : Colors.indigo;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: isDone
            ? const Icon(
                Icons.done,
                size: 52,
                color: Colors.white,
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}

class MySearch extends SearchDelegate {
  final List<String> searchResults = [
    'Flutter',
    'Kotlin',
    'Java',
    'PHP',
    'HTML',
  ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions =
        searchResults.where((result) {
      final input = query.toLowerCase();

      return result.toLowerCase().contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
