import 'package:flutter/material.dart';
import 'package:mchatapp/chat_message.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];



  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.blueAccent,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            new Flexible(
              child: TextField(
          decoration: new InputDecoration.collapsed(
            hintText: "Send a message"
          ),
          controller: _textController,
          onSubmitted: _handleSubmitted,
            ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          Flexible(child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _messages[index],
            itemCount: _messages.length,
            ),),
            new Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _textComposerWidget(),
            )
        ],
      );
  }
}