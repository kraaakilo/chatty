import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Chatty(),
    ),
  );
}

class Chatty extends StatefulWidget {
  const Chatty({Key? key}) : super(key: key);

  @override
  State<Chatty> createState() => _ChattyState();
}

class _ChattyState extends State<Chatty> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Hire me!"),
    );
  }
}
