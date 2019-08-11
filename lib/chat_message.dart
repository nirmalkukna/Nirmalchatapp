import 'package:flutter/material.dart';

const String _name = "Nirmal";

class ChatMessage extends StatelessWidget {
  
final String text ;
ChatMessage({this.text});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 18.0),
            child: CircleAvatar(
              child: Text(_name[0]),
            ),
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_name, style: Theme.of(context).textTheme.subhead),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            )
          ],
          )
        ],
      ),
    );
  }
}