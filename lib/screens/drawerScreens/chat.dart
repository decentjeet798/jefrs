import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../config/styles.dart';
import '../../widgets/appBar.dart';
import '../../widgets/chatMessageTemplate.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  Widget _textComposer(context) {
    var height = MediaQuery.of(context).size.height / 100;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.white),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.attach_file,
              color: AppTheme.facebook,
            ),
            onPressed: () {},
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Type a message"),
              cursorWidth: 2,
              cursorColor: AppTheme.facebook,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: height + 10,
              ),
              controller: _textController,
              onSubmitted: _sendMessage,
            ),
          ),
          IconButton(
            icon: Icon(
              FeatherIcons.send,
              color: AppTheme.facebook,
            ),
            onPressed: () => _sendMessage(_textController.text),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      name: "Ranjeet",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _receiveMessage();
  }

  void _receiveMessage() async {
    await Future.delayed(Duration(milliseconds: 2000));
    ChatMessage message = ChatMessage(
      name: "Support",
      text:
          "Hello There! Need help? Reach out to us right here, and we'll get back to you as soon as possible",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: true,
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBars()
              .chatAppBar("Other", "currently replying in 2 min", context),
          body: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (_, int index) => _messages[index],
                ),
              ),
              Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: _textComposer(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
