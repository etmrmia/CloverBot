import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // scrolling side menu
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // list of pages and directs user to pages
        children: [
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
              margin: EdgeInsets.all(0),
              child: Text('Options',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Discussion Boards'),
            onTap: () {
              Navigator.pushNamed(context, '/alerts');
            },
          ),
          ListTile(
            title: const Text('Moods'),
            onTap: () {
              Navigator.pushNamed(context, '/moods');
            },
          ),
          ListTile(
            title: const Text('Resources'),
            onTap: () {
              Navigator.pushNamed(context, '/pain_level');
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
