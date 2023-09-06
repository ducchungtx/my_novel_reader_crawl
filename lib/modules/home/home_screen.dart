import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Hero(
                tag: 'ListTitle-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text(
                      "BoxNovel",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: const Text(
                      'Novel - English',
                      style: TextStyle(color: Colors.white),
                    ),
                    tileColor: Colors.cyan,
                    onTap: () {
                      print("hihi");
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
