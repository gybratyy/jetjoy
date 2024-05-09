import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets Page'),
      ),
      body: const Center(
        child: Text('This is the Tickets Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
