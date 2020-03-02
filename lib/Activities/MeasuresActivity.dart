import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MeasuresActivity extends StatefulWidget {
  @override
  _MeasuresActivityState createState() => _MeasuresActivityState();
}

class _MeasuresActivityState extends State<MeasuresActivity> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    int conditionIndex_TEMP = 0;
    int conditionIndex_PRESS = 0;
    int conditionIndex_BEATS = 0;

    int temprature = 30;
    int pressure = 32;
    int HeartBeats = 9;

    double tempRatio = temprature * 100 / 37;
    tempRatio = num.parse(tempRatio.toStringAsFixed(1));

    double pressRatio = pressure * 100 / 50;
    pressRatio = num.parse(pressRatio.toStringAsFixed(1));

    double beatsRatio = HeartBeats * 100 / 23;
    beatsRatio = num.parse(beatsRatio.toStringAsFixed(1));

    final List<Color> conditions = [Colors.green, Colors.yellow, Colors.red];

    if (tempRatio >= 70)
      conditionIndex_TEMP = 0;
    else if (tempRatio >= 40 && tempRatio < 70)
      conditionIndex_TEMP = 1;
    else
      conditionIndex_TEMP = 2;

    if (pressRatio >= 70)
      conditionIndex_PRESS = 0;
    else if (pressRatio >= 40 && pressRatio < 70)
      conditionIndex_PRESS = 1;
    else
      conditionIndex_PRESS = 2;

    if (beatsRatio >= 70)
      conditionIndex_BEATS = 0;
    else if (beatsRatio >= 40 && beatsRatio < 70)
      conditionIndex_BEATS = 1;
    else
      conditionIndex_BEATS = 2;
    return Container(
        // ***** Main Container of the page *******
        width: size.width,
        height: size.height,
        child: Padding(
          // ************ Padding of all page *********
          padding: EdgeInsets.only(
              top: size.height * 0.1,
              bottom: size.height * 0.05,
              left: size.width * 0.1,
              right: size.width * 0.1),
          child: Column(
            // ******* base of page contents *********
            children: <Widget>[
              Container(
                width: size.width * 0.8,
                height: size.height * 0.1,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.8 * 0.01,
                      right: size.width * 0.8 * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // *********** row of headline and share icon ****************
                    children: <Widget>[
                      Container(
                        // ****************** HEADLINE *********************
                        width: size.width * 0.8 * 0.8,
                        child: Text(
                          'Live Condition',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.8 * 0.8 * 0.12),
                        ),
                      ),
                      Container(
                        // **************** SHARE ICON *****************
                        width: size.width * 0.8 * 0.1,
                        child: InkWell(
                          child: ImageIcon(
                            AssetImage('assets/share_icon.png'),
                            color: Colors.white,
                            size: size.width * 0.8 * 0.1 * 0.7,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.05,
                  bottom: size.height * 0.05,
                ),
                child: Container(
                  height: size.height * 0.4,
                  width: size.width * 0.8,
                  // ****************** Container of showing results ****************
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        // ******************* Container of Temprature results ***************
                        width: size.width * 0.8,
                        height: size.height * 0.4 * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              // *********************** container of ratio ***********
                              width: size.width * 0.8 * 0.3,
                              child: CircularPercentIndicator(
                                radius: size.height * 0.4 * 0.2 * 0.9,
                                percent: tempRatio / 100,
                                backgroundColor: Colors.white10,
                                progressColor: conditions[conditionIndex_TEMP],
                                lineWidth: size.height * 0.4 * 0.2 * 0.8 * 0.1,
                                center: Text(
                                  '$tempRatio %',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height * 0.4 * 0.2 * 0.2,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            Container(
                              // ************ container of Temp. Text *****************
                              width: size.width * 0.8 * 0.6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Temprature',
                                    style: TextStyle(
                                        fontSize: size.width * 0.8 * 0.4 * 0.20,
                                        color: conditions[conditionIndex_TEMP]),
                                  ),
                                  Text(
                                    '$temprature °C',
                                    style: TextStyle(
                                        fontSize: size.width * 0.8 * 0.4 * 0.15,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.8 * 0.1),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // ******************* Container of Pressure results ***************
                        width: size.width * 0.8,
                        height: size.height * 0.4 * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              // *********************** container of ratio ***********
                              width: size.width * 0.8 * 0.3,
                              child: CircularPercentIndicator(
                                radius: size.height * 0.4 * 0.2 * 0.9,
                                percent: pressRatio / 100,
                                backgroundColor: Colors.white10,
                                progressColor: conditions[conditionIndex_PRESS],
                                lineWidth: size.height * 0.4 * 0.2 * 0.8 * 0.1,
                                center: Text(
                                  '$pressRatio %',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height * 0.4 * 0.2 * 0.2,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            Container(
                              // ************ container of Press. Text *****************
                              width: size.width * 0.8 * 0.6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Pressure',
                                    style: TextStyle(
                                        fontSize: size.width * 0.8 * 0.4 * 0.20,
                                        color:
                                            conditions[conditionIndex_PRESS]),
                                  ),
                                  Text(
                                    '$pressure mm',
                                    style: TextStyle(
                                        fontSize: size.width * 0.8 * 0.4 * 0.15,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.8 * 0.1),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // ******************* Container of Heartbeats results ***************
                        width: size.width * 0.8,
                        height: size.height * 0.4 * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              // *********************** container of ratio ***********
                              width: size.width * 0.8 * 0.3,
                              child: CircularPercentIndicator(
                                radius: size.height * 0.4 * 0.2 * 0.9,
                                percent: beatsRatio / 100,
                                backgroundColor: Colors.white10,
                                progressColor: conditions[conditionIndex_BEATS],
                                lineWidth: size.height * 0.4 * 0.2 * 0.8 * 0.1,
                                center: Text(
                                  '$beatsRatio %',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height * 0.4 * 0.2 * 0.2,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            Container(
                              // ************ container of Temp. Text *****************
                              width: size.width * 0.8 * 0.6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Heartbeat',
                                    style: TextStyle(
                                        fontSize: size.width * 0.8 * 0.4 * 0.20,
                                        color:
                                            conditions[conditionIndex_BEATS]),
                                  ),
                                  Text(
                                    '$HeartBeats BpM',
                                    style: TextStyle(
                                        fontSize: size.width * 0.8 * 0.4 * 0.15,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.8 * 0.1),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  // **************************** Image of heartbeats ******************
                  width: size.width * 0.8,
                  height: size.height * 0.15,
                  child: Image.asset(
                    'assets/normal_beats.png',
                    color: Colors.white54,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
        ));
  }
}
