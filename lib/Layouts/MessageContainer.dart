import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  MessageContainer({this.text, this.name, this.type,this.imageAssets});

  final String text;
  final String name;
  final bool type;
  final String imageAssets ;

  List<Widget> botMessage(context) {
    return <Widget>[
      Container(
        height: 80,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 10),
        child: Image(image: AssetImage(imageAssets),width: 35,),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff202D3D),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Me',
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff202D3D),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      Padding(padding: EdgeInsets.only(right: 10))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}
