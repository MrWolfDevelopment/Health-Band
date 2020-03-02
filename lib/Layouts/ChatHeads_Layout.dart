import 'package:band_project/Layouts/ChatLayout.dart';
import 'package:flutter/material.dart';

class ChatHeads extends StatelessWidget {
  final String userName;
  final String imageAssets;
  const ChatHeads({Key key, this.imageAssets, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=>showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ChatLayout(messageUserName: userName,asset: imageAssets,) ;
                }),
          child: Container(
        width: screenSize.width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image(
              image: AssetImage(imageAssets),
              height: screenSize.height * 0.2 * 0.35,
            ),
            Text(
              userName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.height * 0.2 * 0.35 * 0.25),
            ),
          ],
        ),
      ),
    );
  }
}
