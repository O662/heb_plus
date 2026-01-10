import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'heb_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HEB Plus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 0, 0)),
        useMaterial3: true,
      ),
      home: const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  const _SplashScreen();

  @override
  State<_SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Short delay before navigating to the main page.
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HebPlusPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFFFF231F),
        child: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Keep the image within both width and height to avoid overflow.
                final double available = math.min(
                  constraints.maxWidth,
                  constraints.maxHeight - 80, // leave room for progress + padding
                );
                final double size = math.min(400, math.max(0, available));
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: size,
                      height: size,
                      child: Image.asset(
                        'lib/assets/PLUs.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(minHeight: 4, color: Colors.white),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
