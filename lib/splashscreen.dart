import 'dart:async';

import 'package:dp_consultation/providers/login_form.dart';
import 'package:flutter/material.dart';


class splashscreen extends StatefulWidget{
  @override
  State<splashscreen> createState() => _splashscreen();
}

class _splashscreen extends State<splashscreen>  with TickerProviderStateMixin{
  late AnimationController _controller;
  TextStyle _textStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'fontMAIN',
    color: Colors.black,
  );
  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds:5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => login_forms(title: "Telemedicine App")
      ));
    });
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _controller.repeat(reverse: true);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 755,
        decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/backgroundimg.png'),
        fit: BoxFit.cover)
        ),


          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height: 100,),
                AnimatedDefaultTextStyle(
                  style: _textStyle,
                  duration: Duration(seconds: 1),
                  child: Text('Telemedicine App For'),
                  curve: Curves.easeInOut,
                ),
                AnimatedDefaultTextStyle(
                  style: _textStyle,
                  duration: Duration(seconds: 1),
                  child: Text('Remote Area'),
                  curve: Curves.easeInOut,
                ),

                Container(height: 300,),
                Text(
                  "Find Your Specialists", style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontMAIN',
                  color: Colors.white,

                ),
                ),
Container(height: 11,),
                Text(
                  "Now It make easy to get  ", style: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontMAIN',
                  color: Colors.black,

                ),
                ),

                Text(
                  " online doctor appointment ", style: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontMAIN',
                  color: Colors.black,

                ),
                ),
                Text(
                  " You can take best priscription  ", style: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontMAIN',
                  color: Colors.black,

                ),
                ),
                Text(
                  " using this application  ", style: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontMAIN',
                  color: Colors.black,

                ),
                ),
              ],
            ),
          ),

        ),



              );






  }
}