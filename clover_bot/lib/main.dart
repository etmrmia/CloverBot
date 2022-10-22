import 'package:flutter/material.dart';
import 'package:clover_bot/pages/alerts_list.dart';
import 'package:clover_bot/pages/moods_list.dart';
import 'package:clover_bot/pages/pain_level_list.dart';
import 'package:clover_bot/pages/settings.dart';
import 'package:clover_bot/models/message_info.dart';
import 'package:clover_bot/sidemenu.dart';
import 'package:clover_bot/searchbar.dart';
import 'package:clover_bot/all_messages.dart';
import 'package:clover_bot/models/message.dart';

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
  final controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MessagesInfo message = messages;

    // layout of homepage
    return Scaffold(
      appBar: AppBar(title: Text("Clover Bot")),
      body: Stack(
        children: <Widget>[
          // displays messages in a table
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(6),
            child: Column(
              children: <Widget>[
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: message.length,
                  itemBuilder: (context, index) {
                    return FittedBox(
                      alignment: message.messagesIndex(index).isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.lightGreen,
                          ),
                          child: Text(
                            message.messagesIndex(index).message,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Search bar
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                height: 100.0,
                alignment: FractionalOffset.topCenter,
                child: TextFormField(
                  controller: controller,
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (value) {
                    setState(
                      () {
                        if (controller.text.isNotEmpty) {
                          message.add(
                              Message(message: controller.text, isUser: true));
                          message.add(Message(
                              message: "I'm sorry to hear that...",
                              isUser: false));
                          message.add(Message(
                              message: "Don't worry ! ^-^", isUser: false));
                          message.add(Message(
                              message: "Check out these resources! ",
                              isUser: false));

                          controller.clear();
                        }
                      },
                    );
                  },
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         content: Text(myController.text),
                  //       );
                  //     });
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // Scrolling Sidebar
      drawer: const SideMenu(),
    );
  }
}
