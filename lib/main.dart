import 'package:flutter/material.dart';
import 'screens/main_shell.dart'; // Import the shell!

void main() {
  runApp(const SmartUtilityApp());
}

class SmartUtilityApp extends StatelessWidget {
  const SmartUtilityApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Finance App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      colorScheme: const ColorScheme.light(
      primary: Color(0xFF00327D),
      onPrimary: Colors.white,          
      surface: Colors.white,            
      onSurface: Color(0xFF1E1E1E), 
      ),
    ),
    home: const MainShell(), // Set the shell as the home screen
    );
  }
}

//color: theme.of(context).colorscheme.onprimary