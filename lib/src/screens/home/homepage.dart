// screens/home/homepage.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/serviceprovider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final services = Provider.of<ServiceProvider>(context).services;

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service.title),
            subtitle: Text(service.description),
            trailing: Text('\$${service.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
