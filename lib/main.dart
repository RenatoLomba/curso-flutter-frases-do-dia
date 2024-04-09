import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'Frases do dia';

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Home(title: title),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title });

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _sentences = [
    'O importante não é vencer todos os dias, mas lutar sempre.',
    'É melhor conquistar a si mesmo do que vencer mil batalhas.',
    'O medo de perder tira a vontade de ganhar.',
    'Perder para a razão, sempre é ganhar.'
  ];
  String _generatedSentence = 'Clique abaixo para gerar uma frase!';

  void _generateSentence() {
    int generatedSentenceIndex = Random().nextInt(4);
    setState(() {
      String generatedSentence = _sentences[generatedSentenceIndex];
      _generatedSentence = generatedSentence;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white)
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', fit: BoxFit.fitWidth),
            Text(
              _generatedSentence,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              )
            ),
            MaterialButton(
              onPressed: _generateSentence,
              color: Colors.green,
              textColor: Colors.white,
              child: const Text('Nova frase', style: TextStyle(fontSize: 24))
            )
          ]
        ),
      ),
    );
  }
}

