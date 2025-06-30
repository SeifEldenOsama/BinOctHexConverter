import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'screens/converter_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const BaseConverterApp());
}

class BaseConverterApp extends StatelessWidget {
  const BaseConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base Converter',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        scaffoldBackgroundColor: Color(0xFF1E1E2C),
      ),
      home: const ConverterScreen(), // Your main UI
    );
  }
}
