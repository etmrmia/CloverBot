import 'package:flutter/material.dart';
import 'package:clover_bot/sidemenu.dart';

class AlertList extends StatefulWidget {
  const AlertList({super.key});

  @override
  State<AlertList> createState() => _AlertListState();
}

class _AlertListState extends State<AlertList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Discussion Boards')),
      body: const Center(
        child: Text('Discussion Board'),
      ),
      // Scrolling Sidebar
      drawer: const SideMenu(),
    );
  }
}
