import 'package:flutter/material.dart';
import 'package:clover_bot/sidemenu.dart';

class MoodList extends StatefulWidget {
  const MoodList({super.key});

  @override
  State<MoodList> createState() => _MoodListState();
}

class _MoodListState extends State<MoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Moods')),
      body: const Center(
        child: Text('Moods'),
      ),
      // Scrolling Sidebar
      drawer: const SideMenu(),
    );
  }
}
