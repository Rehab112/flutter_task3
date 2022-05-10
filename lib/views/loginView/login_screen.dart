import 'package:flutter/material.dart';

import '../homeView/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text(
            'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),

      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color:Colors.grey.shade900,),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: Colors.green,
                        ),
                        labelStyle:TextStyle(
                          color: Colors.grey[500],
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700,),
                          borderRadius:BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green,),
                          borderRadius:BorderRadius.circular(25),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.green,
                        ),
                        suffix: Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.green,
                          size: 20,
                        ),
                        labelStyle:TextStyle(
                          color: Colors.grey[500],
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700,),
                          borderRadius:BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green,),
                          borderRadius:BorderRadius.circular(25),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    MaterialButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
