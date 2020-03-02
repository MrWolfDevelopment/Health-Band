import 'package:band_project/Activities/ChatActivity.dart';
import 'package:band_project/Activities/MeasuresActivity.dart';
import 'package:band_project/Activities/Reminder.dart';
import 'package:band_project/sidebar/sidebar.dart';
import 'package:band_project/sidebar/sidebar_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  Color _color = Colors.white;
  Color _barColor = Color(0xff202D3D).withOpacity(0.95);
  int _currentIndex = 2;
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this,length: tabs.length);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  //  ********  activities of the application ***************
  final List<Widget> tabs = [
    // ************* Profile Activity ***************
    Center(
      child: Text('Profile'),
    ),

    // ************* Chat Activity ***************
    ChatActivity(),

    // ************* Measures Activity ***************

    MeasuresActivity(),

    // ************* Reminder Activity ***************

    Reminder(),

    // ************* Location Activity ***************
    Center(
      child: Text('Location'),
    ),
  ];

  

  

  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]); FULL SCREEN
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            //color: Color(0xff202D3D),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff202D3D), Color(0xff110f14)],
                    begin: const FractionalOffset(1.0, 0.5),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.mirror)),
          ),
          tabs[_currentIndex],
          SideBar(),
        ],
      ),
      
      bottomNavigationBar: CurvedNavigationBar(
        
        index: 2,
        backgroundColor: Color(0xff202D3F).withAlpha(100),
        animationCurve: Curves.easeIn,
        color: Color(0xff202D3D),
        height: size.width * 0.12,
        items: <Widget>[
          Icon(
            Icons.person,
            size: 25,
            color: Colors.white,
          ),
          Icon(Icons.chat_bubble, size: 25, color: Colors.white),
          Icon(Icons.cloud_download, size: 25, color: Colors.white),
          Icon(Icons.date_range, size: 25, color: Colors.white),
          Icon(Icons.location_on, size: 25, color: Colors.white),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _tabController.animateTo(_currentIndex);
            _currentIndex = index;
            
          });
        },
      ),
    );
  }
}
