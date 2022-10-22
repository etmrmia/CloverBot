import 'package:flutter/material.dart';
import 'package:clover_bot/sidemenu.dart';

class PainLevelList extends StatefulWidget {
  const PainLevelList({super.key});

  @override
  State<PainLevelList> createState() => _PainLevelListState();
}

class _PainLevelListState extends State<PainLevelList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resources')),
      body: const Center(
        child: Text('Resources'),
      ),
      // Scrolling Sidebar
      drawer: const SideMenu(),
    );
  }
}
