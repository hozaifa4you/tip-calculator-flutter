import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UTip")),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              children: [
                Text(
                  "Welcome to UTip!",
                  style: TextStyle(color: Colors.white70, fontSize: 18.0),
                ),
                Text(
                  "Welcome to UTip!",
                  style: TextStyle(color: Colors.white70, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
