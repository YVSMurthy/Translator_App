import 'package:flutter/material.dart';
import '/pages/home_page.dart';
void main() async {
  // await dotenv.load(fileName: ".env");
  // print('API_URI: ${dotenv.env['API_URI']}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}