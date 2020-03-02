import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);
  Color sideBarColor = Color(0xff202D3D).withOpacity(0.95);
  Color textColor = Colors.white;
  Color iconColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth ,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - screenWidth*0.42,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: sideBarColor,
                //   decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     colors: [Color(0xff110f14), sideBarColor],
                //     begin: const FractionalOffset(0.0, 0.8),
                //     end: const FractionalOffset(1.0, 0.0),
                //     stops: [0.0, 1.0],
                //     tileMode: TileMode.clamp)),
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                 // color: sideBarColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text(
                          "Band App",
                          style: TextStyle(
                              color: textColor,
                              fontSize: screenWidth*0.1*0.6,
                              fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "OPTIONS",
                          style: TextStyle(
                            color: textColor,
                            fontSize: screenWidth*0.1*0.4,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white30,
                          child: Icon(
                            Icons.perm_identity,
                            color: iconColor,
                          ),
                          radius: 25,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: 'assets/location_icon.png',
                        title: "Band Location",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: 'assets/setting_icon.png',
                        title: "Band Setting",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.MyAccountClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: 'assets/charge_icon.png',
                        title: "Band Charge",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.MyOrdersClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: 'assets/credit_icon.png',
                        title: "Band Credit",
                      ),
                      MenuItem(
                        icon: 'assets/info_icon.png',
                        title: "Band Info",
                      ),
                      MenuItem(
                        icon: 'assets/feedback_icon.png',
                        title: "FeedBack",
                      ),
                      MenuItem(
                        icon: 'assets/contact_icon.png',
                        title: "ContactUs",
                      ),
                      MenuItem(
                        icon: 'assets/logout_icon.png',
                        title: "LogOut",
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: screenWidth*0.4,
                      height: 110,
                      color: sideBarColor,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 0, 0, 0);
    path.quadraticBezierTo(width*0.2, height*0.2, width*0.2, height *0.5);
    path.quadraticBezierTo(width*0.2, height *0.5 + 25, width*0.1-20, height );
    path.quadraticBezierTo(0, height , 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
