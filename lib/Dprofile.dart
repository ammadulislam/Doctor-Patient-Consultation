import 'dart:convert';

import 'package:dp_consultation/providers/global_data.dart';
import 'package:dp_consultation/upcomingevents.dart';
import 'package:dp_consultation/usermodel.dart';
import 'package:dp_consultation/utilities/appointmentdetail/appointmentset.dart';
import 'package:dp_consultation/utilities/appointmentdetail/schedule__doctor_detail.dart';
import 'package:dp_consultation/utilities/appointmentdetail/schedule_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class dprofile extends StatefulWidget{
 final int id1;
  final String name;
  final Userspec data;

  const dprofile(this.id1,this.name,{Key? key, required this.data}) : super(key: key);

  @override
  State<dprofile> createState() => _dprofileState();
}

class _dprofileState extends State<dprofile> {
  Future<void> addproductto_wishlist(schedule_detail object) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode(object.toMap());
      final response = await http.post(Uri.parse('${ip}/manageWishlist/Add_wishlist'),
          body: body,
          headers: headers);

      if (response.statusCode == 200) {
        print('Request successful!');

      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
String selected_date="";
  String seleceted_time="";
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    final id = widget.data.user_id;
    final Userspec data1=widget.data;

    return SingleChildScrollView(
      child: Container(
        height: 755,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/signupbackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.purple.shade300,
              title: Text(
                'Profile',
                style: TextStyle(fontFamily: 'fontMAIN'),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/loginicon.png'),
                      backgroundColor: Colors.purple.shade200,
                      radius: 40,
                    ),
                    Container(height: 15,),
                    Text(
                      data1.fullName,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'fontMAIN',
                      ),
                    ),
                    Text(
                      data1.speacility,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'fontMAIN',
                      ),
                    ),
                    Container(height: 20),
                    Text(
                      'Appointment Timings & Dates',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'fontMAIN',
                      ),
                    ),
                    Container(height: 15,),
                    Column(
                      children: [
                        Container(
                          width: 500,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade200,
                            border: Border.all(color: Colors.purple.shade200),
                          ),
                          child: Row(
                            children: [
                              Container(width: 20,),
                              Text(
                                'Date ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'fontMAIN',
                                ),
                              ),

                              Container(width: 100,),
                              Text(
                                'Time',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'fontMAIN',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(height: 15,),
                        Consumer<ScheduleProvider>(
                          builder: (context, provider, child) {
                            provider.find_doctor(id);
                            print('id:'+id.toString());
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: provider.schDet.length,
                              itemBuilder: (context, index) {
                                final data = provider.schDet[index];
                                return Column(
                                  children: [
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade200,
                                        border: Border.all(color: Colors.purple.shade200),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SelectableText(
                                              data.date1.toString(),
                                              style: TextStyle
                                                (
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'fontMAIN',
                          ),
                        ),
                      ),
                     
                      Expanded(
                        child: SelectableText(
                          data.time1.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'fontMAIN',
                          ),
                        ),
                      ),
                      Checkbox(
                        value: isChecked1,
                        onChanged: (newValue) {
                          setState(() {
                            isChecked1 = newValue!;
                            selected_date=data.date1;
                            seleceted_time=data.time1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                                    Container(height:15),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade200,
                                        border: Border.all(color: Colors.purple.shade200),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SelectableText(
                                              data.date2.toString(),
                                              style: TextStyle
                                                (
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'fontMAIN',
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            child: SelectableText(
                                              data.time2.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'fontMAIN',
                                              ),
                                            ),
                                          ),
                                          Checkbox(
                                            value: isChecked2,
                                            onChanged: (newValue) {
                                              setState(() {
                                                isChecked2 = newValue!;
                                                selected_date=data.date2;
                                                seleceted_time=data.time2;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(height:15),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade200,
                                        border: Border.all(color: Colors.purple.shade200),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SelectableText(
                                              data.date3.toString(),
                                              style: TextStyle
                                                (
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'fontMAIN',
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            child: SelectableText(
                                              data.time3.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'fontMAIN',
                                              ),
                                            ),
                                          ),
                                          Checkbox(
                                            value: isChecked3,
                                            onChanged: (newValue) {
                                              setState(() {
    isChecked3 = newValue!;
    selected_date=data.date3;
    seleceted_time=data.time3;
    });
                                            },

                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
              },

              // Replace schDet.length with the actual item count
            );
          },
        ),



        Container(height: 30,),
            ElevatedButton(

                onPressed: (){

                  setappointmentofpatient(id,widget.id1,selected_date,seleceted_time);
                 Navigator.push(context, MaterialPageRoute(
                   builder: (context) => upcomingevent(widget.name,widget.id1),
                  ));

                },child: Text(
                'Make Appointment',style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'fontMAIN'

            )
            ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                ))
            ),

          ],
        ),

        ]
      ),),

      ),),


      ),
    );
  }
}