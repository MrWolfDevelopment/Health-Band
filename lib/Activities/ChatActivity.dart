import 'package:band_project/Layouts/ChatHeads_Layout.dart';
import 'package:band_project/Layouts/ChatMessages.dart';
import 'package:flutter/material.dart';

class ChatActivity extends StatefulWidget {
  @override
  _ChatActivityState createState() => _ChatActivityState();
}

class _ChatActivityState extends State<ChatActivity> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Padding(
          // ************ Padding of all page *********
          padding: EdgeInsets.only(
            top: screenSize.height * 0.1,
          ),
          child: Column(
            // ******* base of page contents *********
            children: <Widget>[
              Container(
                // ********************************* Message Text Container ******************
                alignment: Alignment.topCenter,
                height: screenSize.height * 0.07,
                width: screenSize.width * 0.8,
                child: Text(
                  'Messages',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.width * 0.8 * 0.8 * 0.12),
                ),
              ),
              Container(
                // ****************** users pic. container ******************

                height: screenSize.height * 0.1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ChatHeads(
                      imageAssets: 'assets/user_one.png',
                      userName: 'User1',
                    ),
                    ChatHeads(
                      imageAssets: 'assets/user_two.png',
                      userName: 'User2',
                    ),
                    ChatHeads(
                      imageAssets: 'assets/user_three.png',
                      userName: 'User3',
                    ),
                    ChatHeads(
                      imageAssets: 'assets/user_two.png',
                      userName: 'User4',
                    ),
                    ChatHeads(
                      imageAssets: 'assets/user_three.png',
                      userName: 'User5',
                    ),
                    ChatHeads(
                      imageAssets: 'assets/user_two.png',
                      userName: 'User6',
                    ),
                    ChatHeads(
                      imageAssets: 'assets/user_one.png',
                      userName: 'User7',
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: screenSize.height * 0.05)),
              Container(
                height: screenSize.height * 0.62,

                // ************************* Chat messages container ****************

                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ChatMessages(
                      imageAssets: 'assets/user_two.png',
                      lastMessage:
                          'This text is the message which user two has sent to Band App.',
                      userName: 'User2',
                    ),
                    ChatMessages(
                      imageAssets: 'assets/user_one.png',
                      lastMessage:
                          'This text is the message which user one has sent to Band App.',
                      userName: 'User1',
                    ),
                    ChatMessages(
                      imageAssets: 'assets/user_three.png',
                      lastMessage:
                          'This text is the message which user three has sent to Band App.',
                      userName: 'User3',
                    ),
                    ChatMessages(
                      imageAssets: 'assets/user_two.png',
                      lastMessage:
                          'This text is another message which user two has sent again to Band App.',
                      userName: 'User2',
                    ),
                    ChatMessages(
                      imageAssets: 'assets/user_one.png',
                      lastMessage:
                          'This text is another message which user three has sent again to Band App.',
                      userName: 'User1',
                    ),
                    ChatMessages(
                      imageAssets: 'assets/user_three.png',
                      lastMessage: 'test for a short message.',
                      userName: 'User3',
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
