import 'package:flutter/material.dart';
import 'package:smart_home/paginas/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CodicesSystema(),
    );
  }
}

class CodicesSystema extends StatefulWidget {
  const CodicesSystema({Key? key}) : super(key: key);

  @override
  State<CodicesSystema> createState() => _CodicesSystemaState();
}

class _CodicesSystemaState extends State<CodicesSystema> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
