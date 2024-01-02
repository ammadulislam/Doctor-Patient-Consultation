import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:dp_consultation/utilities/utlity.dart';
import 'DoctorDashboard.dart';
class doctorschedule extends StatefulWidget{
  int id;
  String name;
  String email;
  String phonenumber;
  String gender;
  String experience;
  String speciality;
 doctorschedule(this.id,this.name,this.email,this.phonenumber,this.gender,this.experience,this.speciality);
  @override
  State<doctorschedule> createState() => _doctorscheduleState();
}

class _doctorscheduleState extends State<doctorschedule> {

  var Date1 = TextEditingController();
  var Time1 = TextEditingController();
  var Date2 = TextEditingController();
  var Time2 = TextEditingController();
  var Date3 = TextEditingController();
  var Time3 = TextEditingController();

  int get doctor_id => widget.id;
  Future<String?> Setschedule() async {

    String url = 'http://192.168.0.114/Hospital_System_API/api/Hospital/Setschedule';
    var request = http.MultipartRequest('POST', Uri.parse(url));
   request.fields['doctor_id']=doctor_id.toString();
    request.fields['Date1'] = Date1.text;
    request.fields['Time1'] = Time1.text;
    request.fields['Date2'] = Date2.text;
    request.fields['Time2'] = Time2.text;
    request.fields['Date3'] = Date3.text;
    request.fields['Time3'] = Time3.text;


    var response = await request.send();
    if (response.statusCode == 200) {
      utils.flushBarErrorMessage("Your Schedule Set Successfully",context);

      return response.stream.bytesToString();
    }
    else{
      utils.flushBarErrorMessage("oops,We're sorry",context);
    }
    return null;
  }
  @override


  Widget build(BuildContext context) {
    return Container(
        height: 755,
        decoration: BoxDecoration(image: DecorationImage(
        image: AssetImage('assets/images/signupbackground.png'),
    fit: BoxFit.cover),),
    child: Center(child: Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    backgroundColor: Colors.purple.shade300,
    title: Text('Doctor Schedual', style: TextStyle(fontFamily: 'fontMAIN',)),
    ),
    body: Padding(
    padding: const EdgeInsets.all(8.0),

    child: Column(
    children: [
    Container(height: 11,),
    Container(
    child:Text( "Date & Timing", style: TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'fontMAIN',
    ),
    ),),
      Container(height: 50,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( "Day-1", style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'fontMAIN',
          ),
          ),
          Container(height: 11,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 20,),
              Text( "Date", style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black,
                fontSize: 15,

                fontFamily: 'fontMAIN',
              ),
              ),

              Container(width: 40,),
      Container(
        width: 200,
        child: TextField(
          enabled: true,
          controller: Date1,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            hintText: '',
            isDense: true,
            focusedBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(26),
              borderSide: BorderSide(
                  color: Colors.purple.shade100,
                  width: 3),

            ),

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: BorderSide(
                    color: Colors.purple.shade100,

                )

            ),
            suffixIcon:  IconButton(onPressed: () async {
              DateTime? datePicked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2023),
                lastDate: DateTime(2024),
              );
              if (datePicked != null) {
                String formattedDate = DateFormat('yyyy-MM-dd').format(datePicked);
                Date1.text = formattedDate;
              }
            },
              icon: Icon(Icons.calendar_month_outlined, color: Colors.purple.shade200,size: 30,
              ),

            ),
          ),
        ),
      ),

            ],
          ),
          Container(height: 11,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 20,),
              Text( "Time", style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black,
                fontSize: 15,

                fontFamily: 'fontMAIN',
              ),
              ),

              Container(width: 38,),
              Container(
                width: 200,
                child: TextField(
                  enabled: true,
                  controller: Time1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                    hintText: '',
                    isDense: true,
                    focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(
                          color: Colors.purple.shade100,
                          width: 3),

                    ),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                        borderSide: BorderSide(
                          color: Colors.purple.shade100,

                        )

                    ),
                    suffixIcon:  IconButton(onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                      if(pickedTime!=null){
                        String formattedTime = DateFormat('hh:mm a').format(
                            DateTime(2023, 1, 1, pickedTime.hour, pickedTime.minute));
                        Time1.text = formattedTime;

                      }
                    },
                      icon: Icon(Icons. punch_clock, color: Colors.purple.shade200,size: 30,
                      ),

                    ),
                  ),
                ),
              ),

            ],
          ),
          Container(height: 11,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text( "Day-2", style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'fontMAIN',
              ),
              ),
              Container(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(width: 20,),
                  Text( "Date", style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 15,

                    fontFamily: 'fontMAIN',
                  ),
                  ),

                  Container(width: 40,),
                  Container(
                    width: 200,
                    child: TextField(
                      enabled: true,
                      controller: Date2,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        hintText: '',
                        isDense: true,
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                              color: Colors.purple.shade100,
                              width: 3),

                        ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: BorderSide(
                              color: Colors.purple.shade100,

                            )

                        ),
                        suffixIcon:  IconButton(onPressed: () async {
                          DateTime? datePicked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024),
                          );
                          if (datePicked != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(datePicked);
                            Date2.text = formattedDate;
                          }

                        },
                          icon: Icon(Icons.calendar_month_outlined, color: Colors.purple.shade200,size: 30,
                          ),

                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Container(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(width: 20,),
                  Text( "Time", style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 15,

                    fontFamily: 'fontMAIN',
                  ),
                  ),

                  Container(width: 38,),
                  Container(
                    width: 200,
                    child: TextField(
                      enabled: true,
                      controller: Time2,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        hintText: '',
                        isDense: true,
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                              color: Colors.purple.shade100,
                              width: 3),

                        ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: BorderSide(
                              color: Colors.purple.shade100,

                            )

                        ),
                        suffixIcon:  IconButton(onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode: TimePickerEntryMode.dial,
                          );
                          if(pickedTime!=null){
                            String formattedTime = DateFormat('hh:mm a').format(
                                DateTime(2023, 1, 1, pickedTime.hour, pickedTime.minute));
                            Time2.text = formattedTime;

                          }
                        },
                          icon: Icon(Icons. punch_clock, color: Colors.purple.shade200,size: 30,
                          ),

                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Container(height: 11,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text( "Day-3", style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'fontMAIN',
                  ),
                  ),
                  Container(height: 11,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: 20,),
                      Text( "Date", style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 15,

                        fontFamily: 'fontMAIN',
                      ),
                      ),

                      Container(width: 40,),
                      Container(
                        width: 200,
                        child: TextField(
                          enabled: true,
                          controller: Date3,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                            hintText: '',
                            isDense: true,
                            focusedBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(26),
                              borderSide: BorderSide(
                                  color: Colors.purple.shade100,
                                  width: 3),

                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(26),
                                borderSide: BorderSide(
                                  color: Colors.purple.shade100,

                                )

                            ),
                            suffixIcon:  IconButton(onPressed: () async {
                              DateTime? datePicked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2024),
                              );
                              if (datePicked != null) {
                                String formattedDate = DateFormat('yyyy-MM-dd').format(datePicked);
                                Date3.text = formattedDate;
                              }

                            },
                              icon: Icon(Icons.calendar_month_outlined, color: Colors.purple.shade200,size: 30,
                              ),

                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Container(height: 11,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: 20,),
                      Text( "Time", style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 15,

                        fontFamily: 'fontMAIN',
                      ),
                      ),

                      Container(width: 38,),
                      Container(
                        width: 200,
                        child: TextField(
                          enabled: true,
                          controller: Time3,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                            hintText: '',
                            isDense: true,
                            focusedBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(26),
                              borderSide: BorderSide(
                                  color: Colors.purple.shade100,
                                  width: 3),

                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(26),
                                borderSide: BorderSide(
                                  color: Colors.purple.shade100,

                                )

                            ),
                            suffixIcon:  IconButton(onPressed: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                initialEntryMode: TimePickerEntryMode.dial,
                              );
                              if(pickedTime!=null){
                                String formattedTime = DateFormat('hh:mm a').format(
                                    DateTime(2023, 1, 1, pickedTime.hour, pickedTime.minute));
                                Time3.text = formattedTime;

                              }
                            },
                              icon: Icon(Icons. punch_clock, color: Colors.purple.shade200,size: 30,
                              ),

                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Container(height: 11,),
                  ElevatedButton(onPressed: ()  {

                    String Daate1 = Date1.text.trim();
                    String Tiime1 = Time1.text.trim();
                    String Daate2 = Date1.text.trim();
                    String Tiime2 = Time1.text.trim();
                    String Daate3 = Date1.text.trim();
                    String Tiime3 = Time1.text.trim();
                    // Validate full name
                    if (Daate1.isEmpty) {
                      utils.flushBarErrorMessage("Please enter date of first Day1", context);
                    }

                    // Validate email
                    else if (Tiime1.isEmpty) {
                      utils.flushBarErrorMessage("Please enter time of day 1", context);
                    }

                    // Validate phone number
                    else if (Daate2.isEmpty) {
                      utils.flushBarErrorMessage("Please enter date of Day2", context);
                    }

                    // Validate experience
                    else if (Tiime2.isEmpty) {
                      utils.flushBarErrorMessage("Please enter Time of Day2", context);
                    }
                    else if (Daate3.isEmpty) {
                      utils.flushBarErrorMessage("Please enter date of Day3", context);
                    }

                    // Validate experience
                    else if (Tiime3.isEmpty) {
                      utils.flushBarErrorMessage("Please enter Time of Day3", context);
                    }

                    else {
                      Setschedule();
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DoctorDashboard(widget.id,widget.name,widget.email,widget.phonenumber,
                            widget.gender,widget.experience,widget.speciality),
                      ));
                    }
                  },child: Text(
                      'Set Schedule',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'fontMAIN',
                  )
                  ),
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                      ))
                  ),
        ],
      ),
      ]
    )])
    ])
    ))));
  }
}

