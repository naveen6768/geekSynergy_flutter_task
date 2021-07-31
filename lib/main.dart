import 'package:flutter/material.dart';
import 'package:taskproject/screens/login_screen.dart';
import 'package:taskproject/screens/movies_screen.dart';

import 'package:taskproject/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}
