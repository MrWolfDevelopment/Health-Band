import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class VerifyBand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/background2.png',
              fit: BoxFit.fill,
              width: size.width,
              height: size.height,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,

                height:
                    size.height / 3, // size of container  **half of screen**
                child: Image.asset(
                  'assets/band_logo.png',
                  height: size.height / 3,
                  width: size.width / 1.5,
                ),
              ),
              Container(
                height: 2 * size.height / 3,
                width: size.width / 1.2,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30)),
                        hintText: 'Verified Code',
                        prefixIcon: Image.asset(
                          'assets/verifaied_icon.png',
                          width: 1,
                          height: 1,
                        ),
                        hintStyle: TextStyle(color: Colors.white.withAlpha(80)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    InkWell(
                      child: Image.asset(
                        'assets/verify_button.png',
                        width: size.width / 1.5,
                      ),
                      onTap: () {
                        Toast.show("Checking Code !!!", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    InkWell(
                      child: Text(
                        'RESEND CODE ?',
                        style: TextStyle(
                            color: Colors.white.withAlpha(90), fontSize: 16),
                      ),
                      onTap: () {
                        Toast.show("RESENDING CODE", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      },
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
