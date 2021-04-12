import "package:flutter/material.dart";
import 'package:flutter_chat_app/chatmessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textcontroller = new TextEditingController();
  final List<chatmesssage> _messages = <chatmesssage>[];
  void _handlesubmitted(String text) {
    _textcontroller.clear();
    chatmesssage message = new chatmesssage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposeWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "send a message"),
                controller: _textcontroller,
                onSubmitted: _handlesubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handlesubmitted(_textcontroller.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposeWidget(),
        )
      ],
    );
  }
}
