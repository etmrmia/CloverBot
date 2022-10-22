import 'package:flutter/material.dart';
import 'message.dart';
import 'package:clover_bot/searchbar.dart';

class MessagesInfo extends ChangeNotifier {
  List<Message> messages = <Message>[];

  void add(Message message) {
    messages.add(message);
    notifyListeners();
  }

  int get length {
    return messages.length;
  }

  Message messagesIndex(int index) {
    if (index < messages.length) {
      return messages[index];
    } else {
      throw Exception();
    }
  }
}
