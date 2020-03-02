import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  

  const MenuItem({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ImageIcon(
                  AssetImage(icon),
                  color: Colors.white,
                  size: size.width*0.1*0.5,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: size.width*0.1*0.5,
                      color: Colors.white),
                )
              ],
            ),
            Divider(
              height: 10,
              thickness: 0.5,
              color: Colors.white.withOpacity(0.3),
              indent: 30,
              endIndent: 32,
            ),
          ],
        ),
      ),
    );
  }
}
