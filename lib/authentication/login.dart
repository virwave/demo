// authentication/login.dart

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _handleSignIn(BuildContext context) async {
    // Simulate login process, replace this with your actual login logic
    // For example, you might call an authentication API
    await Future.delayed(const Duration(seconds: 2));

    // Navigate to the home page
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _handleSignIn(context);
          },
          child: const Text('Sign in'),
        ),
      ),
    );
  }
}
