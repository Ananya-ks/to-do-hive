import 'package:flutter/material.dart';
import './login-page.dart';
import './pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void _navigatePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List pages = [
    LoginPage(),
    ToDoMainPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To - do'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.deepPurple[400],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        ],
        onTap: _navigatePage,
        currentIndex: selectedIndex,
      ),
      body: pages[selectedIndex],
    );
  }
}
