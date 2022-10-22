import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
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
            controller: myController,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (value) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(myController.text),
                    );
                  });
            },
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
