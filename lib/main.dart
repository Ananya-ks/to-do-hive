import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './pages/pages.dart';

void main()async{
  await Hive.initFlutter();

  var box = await Hive.openBox('todobox');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LandingPage(),
    );
  }
}
