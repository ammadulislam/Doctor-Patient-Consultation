import 'dart:convert';

import 'package:dp_consultation/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'DoctorDashboard.dart';
import 'docprofile.dart';
import 'doctorschedual.dart';
import 'package:http/http.dart' as http;

class viewschedule extends StatefulWidget{
  int id;
  String name;
  String email;
  String phonenumber;
  String gender;
  String experience;
  String speciality;
  viewschedule(this.id,this.name,this.email,this.phonenumber,this.gender,
      this.experience,this.speciality);
  @override
  State<viewschedule> createState() => _viewscheduleState();

}

class _viewscheduleState extends State<viewschedule> {
late int schedule_id;
late int doctor_id;
late String date1='';
late String Time1='';
late String date2='';
late String Time2='';
late String date3='';
late String Time3='';

  @override
  List<Dschedule> schedule = [];

  @override
  void initState() {
    super.initState();
    void getDoctorSchedule() async {
      try {
        List<dynamic> schedule = await fetchDoctorSchedule(doctor_id); // Replace 123 with the actual doctor ID
        // Process the schedule data as needed
        print(schedule);
      } catch (e) {
        print('Error: $e');
      }
    }

  }
Future<List<dynamic>> fetchDoctorSchedule(int doctorId) async {
  final apiUrl = 'http://192.168.43.237/TelApp/api/users/GetSchedule/$doctorId'; // Replace with your API URL

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load doctor schedule');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}



  var Date1 = TextEditingController();
  Widget build(BuildContext context) {

    print("check kr ");
    print(Time2);
    print(Date1);
    return Container(
        height: 755,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/signupbackground.png'),
    fit: BoxFit.cover),),

    child:  Center(child: Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    backgroundColor: Colors.purple.shade300,
    title: Text('View Schedule',style: TextStyle(fontFamily: 'fontMAIN',)),
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
    Container(width: 40,),
    Text( "Date", style: TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontSize: 15,

    fontFamily: 'fontMAIN',
    ),
    ),

    Container(width: 60,),
    Container(
    width: 200,
    child: Text(date1,style: TextStyle(fontSize: 15, fontFamily: 'fontMAIN', color:Colors.grey),)

    )],
    ),
      Container(height: 11,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(width: 40,),
          Text( "Time", style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontSize: 15,

            fontFamily: 'fontMAIN',
          ),
          ),

          Container(width: 60,),
          Container(
              width: 200,
              child: Text(Time1,style: TextStyle(fontSize: 15, fontFamily: 'fontMAIN', color:Colors.grey),)

          )],
      ),
   ] ),
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
                Container(width: 40,),
                Text( "Date", style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 15,

                  fontFamily: 'fontMAIN',
                ),
                ),

                Container(width: 60,),
                Container(
                    width: 200,
                    child: Text(date2,style: TextStyle(fontSize: 15, fontFamily: 'fontMAIN', color:Colors.grey),)

                )],
            ),
            Container(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 40,),
                Text( "Time", style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 15,

                  fontFamily: 'fontMAIN',
                ),
                ),

                Container(width: 60,),
                Container(
                    width: 200,
                    child: Text(Time2,style: TextStyle(fontSize: 15, fontFamily: 'fontMAIN', color:Colors.grey),)

                )],
            ),
          ] ),
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
                Container(width: 40,),
                Text( "Date", style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 15,

                  fontFamily: 'fontMAIN',
                ),
                ),

                Container(width: 60,),
                Container(
                    width: 200,
                    child: Text(date3,style: TextStyle(fontSize: 15, fontFamily: 'fontMAIN', color:Colors.grey),)

                )],
            ),
            Container(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 40,),
                Text( "Time", style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 15,

                  fontFamily: 'fontMAIN',
                ),
                ),

                Container(width: 60,),
                Container(
                    width: 200,
                    child: Text(Time3,style: TextStyle(fontSize: 15, fontFamily: 'fontMAIN', color:Colors.grey),)

                )],
            ),
          ] ),
      Container(height: 190,),

      Container(
        width: 500,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.purple.shade300,
            border: Border.all(color: Colors.purple.shade100)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DoctorDashboard(widget.id,widget.name,widget.email,widget.phonenumber,
                    widget.gender,widget.experience,widget.speciality),
              ));
            },
              icon: Icon(Icons.add_home_work_rounded, color: Colors.white,size: 30,
              ),
              alignment: Alignment.bottomLeft,
              splashColor: Colors.purple,
              tooltip: 'Home',
              hoverColor: Colors.purple,
            ),
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => doctorschedule(widget.id,widget.name,widget.email,widget.phonenumber,
                    widget.gender,widget.experience,widget.speciality),
              ));
            },
              icon: Icon(Icons.calendar_month_outlined, color: Colors.white,size: 30,
              ),
              alignment: Alignment.bottomLeft,
              splashColor: Colors.purple,
              tooltip: 'Set Schedule',color: Colors.purple,
              hoverColor: Colors.purple,
            ),
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => viewschedule(widget.id,widget.name,widget.email,widget.phonenumber,
                    widget.gender,widget.experience,widget.speciality),
              ));
            },
              icon: Center(
                child: Icon(Icons.calendar_view_week, color: Colors.white,size: 30,
                ),
              ),
              alignment: Alignment.bottomLeft,
              splashColor: Colors.purple,
              tooltip: 'view schedule',color: Colors.purple,
              hoverColor: Colors.purple,
            ),

            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => docprofile(widget.id,widget.name,widget.email,widget.phonenumber,
                    widget.gender,widget.experience,widget.speciality),
              ));
            },
              icon: Icon(Icons.person_pin, color: Colors.white,size: 30,
              ),
              alignment: Alignment.bottomLeft,
              splashColor: Colors.purple,
              tooltip: 'profile',
              hoverColor: Colors.purple,
            ),
          ],
        ),
      )
    ])
    )
    )));
  }
}