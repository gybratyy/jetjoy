import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings Page'),
      ),
      body: const Center(
        child: Text('This is the Account Settings Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
