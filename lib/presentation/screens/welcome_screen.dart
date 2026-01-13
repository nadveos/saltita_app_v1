import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
        children: [
          Center(
            child: Text('Welcome Screen'),
          ),
          ElevatedButton(
            onPressed: () {
            context.go('/home');
            },
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
            
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}