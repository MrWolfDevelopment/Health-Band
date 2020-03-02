import 'package:band_project/Layouts/ChatLayout.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final String imageAssets;
  final String userName;
  final String lastMessage;
  
  const ChatMessages(
      {Key key, this.userName, this.imageAssets, this.lastMessage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      // ******************** container from class chat messages ***********
      height: screenSize.height * 0.12,

      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ChatLayout(messageUserName: userName,asset: imageAssets,) ;
                }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage(imageAssets),
                  width: screenSize.width * 0.8 * 0.20,
                ),
                Column(
                  //  ******************* message text *******************
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: screenSize.width * 0.8 * 0.6,
                      alignment: Alignment.topLeft,
                      child: Text(
                        userName,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.8 * 0.07,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.8 * 0.6,
                      child: Text(
                        lastMessage,
                        style: TextStyle(
                            fontSize: screenSize.width * 0.8 * 0.04,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: screenSize.height * 0.12 * 0.2,
            thickness: 0.5,
            color: Colors.white.withOpacity(0.3),
            indent: 32,
            endIndent: 32,
          ),
        ],
      ),
    );
  }
}
