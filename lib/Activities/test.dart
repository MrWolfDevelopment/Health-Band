import 'package:flutter/material.dart';
class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;

    
    return Container(
      height: size.height,
      width: size.width,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            
            Padding(
              padding:  EdgeInsets.only(top: size.height*0.1,left: size.width*0.1),
              child: Container(
                height: size.height*0.25,
                width: size.width*0.5,
                color: Colors.green,
                child: Padding(
                  padding:  EdgeInsets.only(top:size.height*0.25*.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.orange,
                        height: size.height*0.25*0.25,
                        width: size.width*0.5*0.25,
                      ),
                      Container(
                        color: Colors.orange,
                        height: size.height*0.25*0.25,
                        width: size.width*0.5*0.25,
                      ),
                      Container(
                        height: size.height*0.25*0.7,
                        width: size.width*0.5*0.25,
                        color: Colors.red,
                      )
                    ],

                  ),
                ),
              ),
            )
          ],
        ),

      ),
      
    );
  }
}