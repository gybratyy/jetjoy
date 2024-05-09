import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Page'),
      ),
      body: const Center(
        child: Text('This is the Booking Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
