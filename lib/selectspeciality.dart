import 'dart:convert';

import 'package:dp_consultation/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'Finddoctor.dart';
import 'PatientDashboard.dart';
import 'package:http/http.dart' as http;

import 'User.dart';
import 'myprofile.dart';

class selectspeciality extends StatefulWidget {  @override
int id;
String name;
selectspeciality(this.id,this.name);
  State<selectspeciality> createState() => _selectspecialityState();
}

class _selectspecialityState extends State<selectspeciality> {
  List<Userspec> data = [];
String speci='';
  String speciality = '';
  Future<String?> getdoctors(String speciality) async
  {
    String url = 'http://192.168.1.12/TelApp/api/users/getdoctor?speciality=$speciality';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
  return Container(
      height: 755,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/signupbackground.png'),
          fit: BoxFit.cover),),
     child:  Center(child: Scaffold(
       backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade300,
          title: Text('Patient',style: TextStyle(fontFamily: 'fontMAIN',)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),

          child: Column(

            children: [
              Container(height: 20,),
          Container(
          child:Text( "Select Speciality", style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'fontMAIN',
          ),),
          ),
            Container(height: 95,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(

                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(165, 65),
                    side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                  onPressed: () {
                    speci='Dentist';
                    Navigator.push(context, MaterialPageRoute
                      (builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                },

                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage('assets/images/purple teeth.png',
                          ),
                          backgroundColor: Colors.purple.shade300,
                          radius: 15
                      ),

                      Text(
                        "Dentist", style: TextStyle( fontSize: 18,
                        fontFamily: 'fontMAIN',
                        color: Colors.black,
                      ),
                      ),
                    ],
                  ),

                ),
                OutlinedButton(

                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(165, 65),
                    side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                  onPressed: (){
    speci='Dermatologist';
    Navigator.push(context, MaterialPageRoute(builder: (context)=>finddoctor(widget.id,widget.name,speci)));


  },



                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage('assets/images/dermotologist.png',
                          ),
                          backgroundColor: Colors.purple.shade300,
                          radius: 15
                      ),

                      Text(
                        "Dermotologist", style: TextStyle( fontSize: 16,
                        fontFamily: 'fontMAIN',
                        color: Colors.black,
                      ),
                      ),
                    ],
                  ),

                ),
              ],
            ),
              Container(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(165, 65),
                      side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                    onPressed: ()  {
    speci='Gynecologist';
    Navigator.push(context, MaterialPageRoute
      (builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                    },

                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage('assets/images/gynecologist.png',
                            ),
                            backgroundColor: Colors.purple.shade300,
                            radius: 16
                        ),

                        Text(
                          "Gyecologist", style: TextStyle( fontSize: 18,
                          fontFamily: 'fontMAIN',
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),

                  ),

                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(165, 65),
                      side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                    onPressed: () {
    speci='Nerulogist';
    Navigator.push(context, MaterialPageRoute(builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                    },

                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage('assets/images/neruologist.png',
                            ),
                            backgroundColor: Colors.purple.shade300,
                            radius: 14
                        ),
                        Text(
                          "Neruologist", style: TextStyle( fontSize: 18,
                          fontFamily: 'fontMAIN',
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),

                  ),

                ],
              ),
              Container(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(165, 65),
                      side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                    onPressed: (){
                      speci='Edrocrinologist';
                    Navigator.push(context, MaterialPageRoute
                      (builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                    },

                    child: Text(
                      "Edocrinologist", style: TextStyle( fontSize: 19,
                      fontFamily: 'fontMAIN',
                      color: Colors.black,
                    ),
                    ),

                  ),
                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(165, 65),
                      side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                    onPressed: (){

    speci='Phsychitrist';
    Navigator.push(context, MaterialPageRoute(builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                    },

                    child: Text(
                      "Phsychitrist", style: TextStyle( fontSize: 18,
                      fontFamily: 'fontMAIN',
                      color: Colors.black,
                    ),
                    ),

                  ), ],
              ),
              Container(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(160, 65),
                      side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                    onPressed: (){

                      speci='Medical_Genetic';
                      Navigator.push(context, MaterialPageRoute
                        (builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                    },

                    child: Text(
                      "Medical Genetic", style: TextStyle( fontSize: 18,
                      fontFamily: 'fontMAIN',
                      color: Colors.black,
                    ),
                    ),

                  ),
                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(160, 65),
                      side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                    onPressed: (){
                      speci='Family_physician';
                      Navigator.push(context, MaterialPageRoute
                        (builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                    },

                    child: Text(
                      "Family Physician", style: TextStyle( fontSize: 17,
                      fontFamily: 'fontMAIN',
                      color: Colors.black,
                    ),
                    ),

                  ),  ],
              ),
              Container(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(160, 65),
                      side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                     onPressed: ()  {
                       speci='Audiologist';
                       Navigator.push(context, MaterialPageRoute
                         (builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                    },

                    child: Text(
                      "Audiologist", style: TextStyle( fontSize: 20,
                      fontFamily: 'fontMAIN',
                      color: Colors.black,
                    ),
                    ),

                  ),
                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(160, 65),
                      side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

                    onPressed: () {
                      speci='Throat_Specialist';
                      Navigator.push(context, MaterialPageRoute
                        (builder: (context)=>finddoctor(widget.id,widget.name,speci)));
                      }
                    ,

                    child: Text(
                      "Throat Specialist", style: TextStyle( fontSize: 17.5,
                      fontFamily: 'fontMAIN',
                      color: Colors.black,
                    ),
                    ),

                  ),],
              ),
              Container(height: 60,),
              Container(
                width: 600,
                height: 45,
                color: Colors.purple.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => patientDashboard(widget.id,widget.name),
                        ));

                      },
                        icon: Icon(Icons.add_home_work_rounded, color: Colors.white,size: 30,
                        ),
                        alignment: Alignment.bottomLeft,
                        splashColor: Colors.white,
                        tooltip: 'Home',
                        hoverColor: Colors.purple,
                      ),
                      IconButton(onPressed: () {

                      },
                        icon: Icon(Icons.folder_special, color: Colors.white,size: 30,
                        ),
                        alignment: Alignment.center,
                        splashColor: Colors.white,
                        tooltip:' Speciality',
                        hoverColor: Colors.purple,),
                      IconButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => myprofile(),
                        ));


                      },
                        icon: Icon(Icons.person_pin, color: Colors.white,size: 30,
                        ),
                        alignment: Alignment.bottomRight,
                        splashColor: Colors.yellow,
                        tooltip: 'profile',
                      ),
                    ],
                  ),
                ),
              )

            ]
        ),
          ),),)
  );
  }}
