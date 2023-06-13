import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home page'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/game");
                },
                child: const Text('go to game'))
          ],
        ),
      ),
    );
  }
}
