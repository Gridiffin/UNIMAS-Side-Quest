// screens/auth/loginscreen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/authprovider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .login(
                  emailController.text,
                  passwordController.text,
                )
                    .then((_) {
                  Navigator.pushReplacementNamed(context, '/home');
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
