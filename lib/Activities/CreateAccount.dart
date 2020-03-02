import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/signup_backgroung3.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
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
                // column of inserting data
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30)),
                        hintText: 'Full Name',
                        hintStyle: TextStyle(color: Colors.white.withAlpha(80)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30)),
                        hintText: 'E-mail Address',
                        hintStyle: TextStyle(color: Colors.white.withAlpha(80)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30)),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white.withAlpha(80)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    InkWell(
                      child: Image.asset(
                        'assets/create_button.png',
                        width: size.width / 1.5,
                      ),
                      onTap: (){Toast.show("Creating New Account !!!", context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);},
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
