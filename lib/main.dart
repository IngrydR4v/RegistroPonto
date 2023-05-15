import 'package:flutter/material.dart';
import 'package:trabalho_localizacao/pages/principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNIMATER - Registro do ponto',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: Principal(),
    );
  }
}
