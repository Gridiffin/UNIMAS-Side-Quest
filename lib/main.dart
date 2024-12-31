// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/providers/authprovider.dart';
import 'src/providers/serviceprovider.dart';
import 'src/screens/auth/loginscreen.dart';
import 'src/screens/home/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ServiceProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        routes: {
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
