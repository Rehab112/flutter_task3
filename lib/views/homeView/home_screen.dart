import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:project3/views/homeView/components/gender_box.dart';
import '../resultView/result_screen.dart';
import 'components/grey_txt.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _maleClick = false;
  bool _femaleClick = false;
  bool isKg = true;
  bool isCm = true;
  bool isInch = false;
  int weightCount = 56;
  int heightCount = 162;
  int ageCount = 29;
  double lbs = 0;
  double inch = 0;
  double ft = 0;
  double result = 0;
  String weightDropDown = 'kg';
  String heightDropDown = 'cm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading:IconButton(
          onPressed: (){},
          icon: Transform.scale(
            scaleX: -1,
            child: Icon(
              Icons.segment,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 30.0,
              ),
          ),
        ],

      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GreyTxt('Gender'),
            Row(
              children: [
                GenderBox(
                    border: Border.all(width: 2, color: _maleClick == false ?  Colors.grey.shade900 : Colors.green,),
                    button: MaterialButton(
                      onPressed: (){
                        setState(() {
                          _maleClick = !_maleClick;
                          _femaleClick = false;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.only(
                              start: 120,
                              top: 6,
                            ),
                            child: Icon(
                              _maleClick == false ? Icons.check_circle_outline_rounded : Icons.check_circle,
                              color: _maleClick == false ? Colors.grey[700] : Colors.green,
                              size: 30,
                            ),
                          ),
                          Icon(
                            Icons.man_outlined,
                            size: 100,
                            color: Colors.white,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),

                    ),
                ),
                SizedBox(
                  width: 20,
                ),
                GenderBox(
                  border: Border.all(width: 2, color: _femaleClick == false ?  Colors.grey.shade900 : Colors.green,),
                  button: MaterialButton(
                    onPressed: (){
                      setState(() {
                        _femaleClick = !_femaleClick;
                        _maleClick = false;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsetsDirectional.only(
                            start: 120,
                            top: 6,
                          ),
                          child: Icon(
                            _femaleClick == false ? Icons.check_circle_outline_rounded : Icons.check_circle,
                            color: _femaleClick == false ? Colors.grey[700] : Colors.green,
                            size: 30,
                          ),
                        ),
                        Icon(
                          Icons.woman_outlined,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GreyTxt('Weight'),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      weightCount--;
                                      lbs = double.parse((weightCount / 0.45359237).toStringAsFixed(2));
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_rounded,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    isKg ? '$weightCount':'$lbs',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      weightCount++;
                                      lbs = double.parse((weightCount / 0.45359237).toStringAsFixed(2));
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_circle_rounded,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 15,),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              onChanged:(String ? newVal){
                                setState(() {
                                  weightDropDown = newVal!;
                                  weightDropDown == 'kg' ? isKg = true : isKg = false;
                                  lbs = double.parse((weightCount / 0.45359237).toStringAsFixed(2));
                                });
                              },
                              items: <String>['kg', 'lps'].map<DropdownMenuItem<String>>((String val){
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              }).toList(),
                              hint: Text(
                                weightDropDown,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.black,
                              ),
                              buttonWidth: double.infinity,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GreyTxt('Height'),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      heightCount--;
                                      ft = double.parse((heightCount / 30.48).toStringAsFixed(2));
                                      inch = double.parse((heightCount / 2.54).toStringAsFixed(2));
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_rounded,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    isCm ?'$heightCount': isInch ? '$inch' : '$ft',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      heightCount++;
                                      ft = double.parse((heightCount / 30.48).toStringAsFixed(2));
                                      inch = double.parse((heightCount / 2.54).toStringAsFixed(2));
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_circle_rounded,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 15,),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              onChanged:(String ? newVal){
                                setState(() {
                                  heightDropDown = newVal!;
                                  if(heightDropDown == 'cm'){
                                    isCm = true;
                                    isInch = false;
                                  }
                                  else if(heightDropDown == 'inch'){
                                    isCm = false;
                                    isInch = true;
                                    inch = double.parse((heightCount / 2.54).toStringAsFixed(2));
                                  }
                                  else {
                                    isCm = false;
                                    isInch = false;
                                    ft = double.parse((heightCount / 30.48).toStringAsFixed(2));
                                  }

                                });
                              },
                              items: <String>['cm', 'ft', 'inch'].map<DropdownMenuItem<String>>((String val){
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              }).toList(),
                              hint: Text(
                                heightDropDown,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.black,
                              ),
                              buttonWidth: double.infinity,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GreyTxt('Age'),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: (){
                              setState(() {
                                ageCount--;
                              });
                            },
                            icon: Icon(
                              Icons.remove_circle_rounded,
                              size: 25,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '$ageCount',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: (){
                              setState(() {
                                ageCount++;
                              });
                            },
                            icon: Icon(
                              Icons.add_circle_rounded,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 20, top: 10,),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextButton(
                    onPressed: (){
                      result = weightCount/ pow(heightCount/100, 2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(res: result, weight: weightCount,),
                        ),
                      );
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
