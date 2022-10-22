import 'package:flutter/material.dart';
import 'package:clover_bot/pages/alerts_list.dart';
import 'package:clover_bot/pages/moods_list.dart';
import 'package:clover_bot/pages/pain_level_list.dart';
import 'package:clover_bot/pages/settings.dart';
import 'package:clover_bot/sidemenu.dart';
import 'package:clover_bot/searchbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clover Bot",
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              foregroundColor: Colors.white)),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/alerts': (BuildContext context) => const AlertList(),
        '/moods': (BuildContext context) => const MoodList(),
        '/pain_level': (BuildContext context) => const PainLevelList(),
        '/settings': (BuildContext context) => const SettingsPage(),
      },
    );
  }
}

// home page
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // layout of homepage
    return Scaffold(
      appBar: AppBar(title: Text("Clover Bot")),
      body: Stack(
        children: <Widget>[
          // displays messages in a table
          Table(
            children: const [
              TableRow(children: <Widget>[TableCell(child: Text('something'))])
            ],
          ),
          // Search bar
          const SearchBar(),
        ],
      ),
      // Scrolling Sidebar
      drawer: const SideMenu(),
    );
  }
}
