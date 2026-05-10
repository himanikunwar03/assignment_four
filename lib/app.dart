
import 'package:assignment_four/views/dashboard_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee and image grid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 105, 137, 126),
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}