import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/calc.dart';
import 'pages/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thanathip Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 57, 29, 106)),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  
  final tabs = [
    const HomePage(), 
    const CalculatePage(), 
    const ContactPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thanathip Shop"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: tabs[_currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Homepage"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate), label: "Calculate"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail), label: "Contact"
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
    );
  }
}
