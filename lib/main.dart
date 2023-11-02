import 'dart:async';

import 'package:demo_api_call_bloc_clean_architecture/di/get_it.dart';
import 'package:demo_api_call_bloc_clean_architecture/features/home_page/presentation/views/home_page_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  mainFunction();
}

Future<void> mainFunction() async {
  unawaited(init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePageScreen(),
    );
  }
}
