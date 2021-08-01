import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gpa_calculator/Widgets/cardwidget.dart';
import 'package:gpa_calculator/Widgets/buttonicon.dart';
import 'constants.dart';
import 'package:gpa_calculator/resultspage.dart';
import 'calculatorfunction.dart';

class BodyWidgets extends StatefulWidget {
  const BodyWidgets({Key? key}) : super(key: key);

  @override
  _BodyWidgetsState createState() => _BodyWidgetsState();
}

class _BodyWidgetsState extends State<BodyWidgets> {
  int _semNum = 1;
  int _courseNum = 6;
  List<String> _grade = [
    'O',
    'O',
    'O',
  ];
  List<int> _gradePoints = [
    10,
    10,
    10,
  ];
  List<String> _credit = [
    '4',
    '4',
    '4',
  ];
  List _list = [
    1,
    2,
    3,
  ];

  List<DropdownMenuItem<String>> createMenuItem() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var point in kPoints) {
      var newItem = DropdownMenuItem<String>(
        child: Text(
          point,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        value: point,
      );

      menuItems.add(newItem);
    }
    return menuItems;
  }

  List<DropdownMenuItem<String>> CreditMenuItem() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var credit in kCredits) {
      var newItem = DropdownMenuItem<String>(
        child: Text(
          credit,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        value: credit,
      );

      menuItems.add(newItem);
    }
    return menuItems;
  }

  void addToList() {
    setState(() {
      _list.add(1);
      _grade.add('O');
      _gradePoints.add(10);
      _credit.add('4');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: CardWidget(
                    title: 'Enter Semester Number',
                    defaultVals: _semNum,
                    row: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonIcon(
                          iconData: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              if (_semNum > 1) {
                                _semNum--;
                              }
                            });
                          },
                        ),
                        ButtonIcon(
                          iconData: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              if (_semNum < 10) {
                                _semNum++;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: CardWidget(
                    title: 'No. Of Courses',
                    defaultVals: _courseNum,
                    row: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonIcon(
                          iconData: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              if (_courseNum > 1) {
                                _courseNum--;
                              }
                            });
                          },
                        ),
                        ButtonIcon(
                          iconData: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              if (_courseNum < 12) {
                                _courseNum++;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    setState(() {
                      if (_list.length > 1) {
                        _list.removeAt(index);
                      }
                    });
                  },
                  background: Container(
                    color: Color(0xFFEA1556),
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                    child: CardWidget(
                      title: 'Enter Grade Obtained and Credit of course',
                      defaultVals: _gradePoints[index],
                      row: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DropdownButton<String>(
                                focusColor: Color(0xFF006555),
                                iconEnabledColor: Color(0xFF06C46B),
                                value: _grade[index],
                                dropdownColor: Color(0xFF06C46B),
                                items: createMenuItem(),
                                onChanged: (value) {
                                  setState(() {
                                    _grade[index] = value.toString();
                                    _gradePoints[index] =
                                        kGrades[_grade[index]];
                                  });
                                },
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                              ),
                              DropdownButton<String>(
                                focusColor: Color(0xFF006555),
                                iconEnabledColor: Color(0xFF06C46B),
                                value: _credit[index],
                                dropdownColor: Color(0xFF06C46B),
                                items: CreditMenuItem(),
                                onChanged: (value) {
                                  setState(() {
                                    _credit[index] = value.toString();
                                  });
                                },
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFF06C46B),
                  ),
                  child: TextButton(
                    child: Text(
                      'Add new course',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      if (_list.length < _courseNum) {
                        addToList();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFF06C46B),
                  ),
                  child: TextButton(
                    child: Text(
                      'CALCULATE GPA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      if (_list.length == _courseNum) {
                        CalculatorFunction calFunc = CalculatorFunction(
                          credits: _credit,
                          points: _gradePoints,
                          courses: _courseNum,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ResultsPage(
                                gpa: calFunc.GpaCalc(),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
