import 'package:flutter/material.dart';
import 'package:clover_bot/sidemenu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: const Center(
        child: Text('Settings'),
      ),
      // Scrolling Sidebar
      drawer: const SideMenu(),
    );
  }
}
