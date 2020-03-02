import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:intl/intl.dart';

class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  DateTime _currentDate = DateTime.now();
  String formattedDate = DateFormat.yMMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.05,
        ),
        child: Column(
          children: <Widget>[
            Container(
              // ********************************* Headline Reminder Text Container ******************
              alignment: Alignment.center,
              height: screenHeight * 0.1,
              width: screenWidth * 0.8,
              child: Text(
                'Reminder',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.8 * 0.8 * 0.12),
              ),
            ),
            // ********************** calendar Container *******************************
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.4,
                  child: CalendarCarousel<Event>(
                    onDayPressed: (DateTime date, List<Event> events) {
                      this.setState(() => formattedDate = DateFormat.yMMMMd(date).toString());
                      //DateFormat.yMMMMd(formattedDate);
                    },
                    childAspectRatio: 1.3,
                  )),
            ),

            // ********************** BU and listview of day **********************
            Container(
              width: screenWidth * 0.95,
              height: screenHeight * 0.38,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: screenHeight * 0.02)),
                  Text(
                    formattedDate,
                    style: TextStyle(
                        fontSize: screenHeight * 0.03, color: Colors.white),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                        size: screenHeight * 0.04,
                      ),
                      onPressed: () => print(_currentDate))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
