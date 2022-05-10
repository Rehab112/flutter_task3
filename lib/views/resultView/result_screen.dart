import 'package:flutter/material.dart';
import 'package:project3/views/homeView/home_screen.dart';
class ResultScreen extends StatefulWidget {
  final double res;
  final int weight;
  ResultScreen({required this.res, required this.weight});

  @override
  State<ResultScreen> createState() => _ResultScreen(res: this.res, weight: this.weight,);
}

class _ResultScreen extends State<ResultScreen> {
  double res;
  int weight;
  Color _color = Colors.greenAccent;
  String _state = '';
  _ResultScreen({required this.res, required this.weight});
  @override
  void initState() {
    super.initState();
    if(res < 18.5){
      _state += 'Underweight';
      _color = Colors.lightBlueAccent;
    }
    else if (res < 24.9){
      _state += 'Ideal';
      _color = Colors.greenAccent;
    }
    else if(res < 29.9){
      _state += 'Overweight';
      _color = Colors.orangeAccent;
    }
    else{
      _state += 'Obese';
      _color = Colors.redAccent;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
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
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Result',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Your current BMI',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        res.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          width: 160,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$weight kg',
                                style: TextStyle(
                                  color: _color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'May 2020',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20,),
              decoration: BoxDecoration(
                //color: Colors.yellow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                          text: 'Your BMI is ',
                          style: TextStyle(
                              color: Colors.white,
                            fontSize: 20,
                          ),
                          ),
                          TextSpan(
                          text: res.toStringAsFixed(1),
                          style: TextStyle(
                              color: _color,
                              fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          ),
                          TextSpan(
                            text: ', indicating your weight is in the ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: _state,
                            style: TextStyle(
                              color: _color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: ' category of your height.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                    ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
