import 'dart:io';

import 'package:band_project/Layouts/MessageContainer.dart';
import 'package:flutter/material.dart';

class ChatLayout extends StatefulWidget {
  final String messageUserName;
  final String asset;
  const ChatLayout({Key key, this.messageUserName, this.asset})
      : super(key: key);

  @override
  _ChatLayoutState createState() => _ChatLayoutState();
}

class _ChatLayoutState extends State<ChatLayout> {
  final List<MessageContainer> _messages = <MessageContainer>[];
  final TextEditingController _textController = new TextEditingController();

  void _submitQuery(String text) {
    _textController.clear();
    MessageContainer message = new MessageContainer(
      text: text,
      name: widget.messageUserName,
      type: true,
    );

    if (message.text.isNotEmpty)
      setState(() {
        _messages.insert(0, message);
      });

    _responing(text);
  }

  Future _responing(String text) async {
    await new Future.delayed(const Duration(seconds: 2));
    MessageContainer respond = MessageContainer(
      text: text,
      name: widget.messageUserName,
      type: false,
      imageAssets: widget.asset,
    );
    if (respond.text.isNotEmpty)
      setState(() {
        _messages.insert(0, respond);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.linear_scale,
            size: 25,
          ),
          Padding(padding: EdgeInsets.only(right: 15))
        ],
        title: Text(widget.messageUserName),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      ),
      //resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffffffff), Color(0xffc3dbdd)],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(0.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Column(children: <Widget>[
          Flexible(
              child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true, //To keep the latest messages at the bottom
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          )),
          Divider(height: 1.0),
          Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _queryInputWidget(context),
          ),
        ]),
      ),
    );
  }

  _queryInputWidget(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }
}
