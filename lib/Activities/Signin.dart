import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/main_background.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(size.width / 5.0,
                      size.height / 10, size.width / 5.0, 0.0),
                  child: Image.asset(
                    'assets/band_logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(size.width / 10.0,
                      size.height / 10, size.width / 10.0, size.height / 50),
                  alignment: Alignment.center,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30)),
                      hintText: 'E-mail Address',
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80)),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      size.width / 10, size.height / 180, size.width / 10, 0.0),
                  alignment: Alignment.center,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30)),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80)),
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
                // **************** sign in button ********************
                Container(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(size.width / 5.0,
                          size.height / 15, size.width / 5.0, 0.0),
                      child: InkWell(
                          child: Image.asset('assets/signin_button.png'),
                          onTap: () {
                            Toast.show("تسجيل الدخول يابا", context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          })),
                ),
                // *************** forget password ****************
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, size.height / 40, 0, 0.0),
                    child: FlatButton(
                      child: Text(
                        "Forgot password ?",
                        style: TextStyle(
                            color: Colors.white.withAlpha(80), fontSize: 18),
                      ),
                      onPressed: () {
                        Toast.show("نسيت الباسورد .. فالح", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "______________________________________",
                    style: TextStyle(
                        fontSize: 15, color: Colors.white.withAlpha(80)),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(
                //       size.width / 5.0, size.height / 5, size.width / 5.0, 0.0),
                //   child: Text(
                //     "_________________________________",
                //     style: TextStyle(
                //         fontSize: 15, color: Colors.white.withAlpha(80)),
                //   ),
                // ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: InkWell(
                      child: Text(
                        "New Band ? Sign up",
                        style: TextStyle(
                            color: Colors.white.withAlpha(80), fontSize: 18),
                      ),
                      onTap: () {
                        Toast.show("لاء منتش عامل اكونت جديد", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
