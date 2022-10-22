import 'package:clover_bot/main.dart';
import 'package:clover_bot/models/message.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:clover_bot/models/message_info.dart';
import 'main.dart';
import 'package:clover_bot/all_messages.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    messages
                        .add(Message(message: controller.text, isUser: false));
                    //messages.add(Message(message: 'I hear you', isUser: false));
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
    );
  }
}
