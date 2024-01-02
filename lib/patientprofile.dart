import 'package:dp_consultation/patient_report.dart';
import 'package:dp_consultation/utilities/appointment_model.dart';
import 'package:dp_consultation/videocall.dart';
import 'package:flutter/material.dart';


class patientprofile extends StatelessWidget{
  Appointment appointment;
  patientprofile(this.appointment);

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
    title: Text('Profile',style: TextStyle(fontFamily: 'fontMAIN',)),
    ),
    body: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(height: 15,),
    Container(
    child:Center(
    child: Text(appointment.fullName, style: TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'fontMAIN',
    ),
    ),
    ),),
    Container(height: 11,),
    CircleAvatar(
    backgroundImage: AssetImage('assets/images/loginicon.png',
    ),
    backgroundColor: Colors.purple.shade200,
    radius: 40,

    ),
    Container(height: 11,),
    Container(
    width: 300 ,
    height: 400,

    decoration: BoxDecoration(
    color: Colors.purple.shade50,

    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),

    ),

    ),
    child: Column(

    children: [
    Container(height: 30,),
    Container(
    child: Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text('Email:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text(appointment.emailAddress,style: TextStyle(fontSize: 12,),),
    Container(width: 11,),
    Container(
    height: 35,
    width: 35,
    decoration: BoxDecoration(
    color: Colors.purple.shade200,
    shape: BoxShape.circle


    ),
    child:  IconButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => videocall(callID: "1",),
      ));
    },
      icon: Center(
        child: Icon(Icons.video_call, color: Colors.white,size: 21,
        ),
      ),
      alignment: Alignment.bottomLeft,
      splashColor: Colors.white,
      tooltip: 'video call',color: Colors.purple,
      hoverColor: Colors.purple,
    ),),
      Container(width: 11,),
      Container(
        height: 34,
        width: 36,
        decoration: BoxDecoration(
            color: Colors.purple.shade200,
            shape: BoxShape.circle


        ),
        child:  IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => patient_report()
          ));
        },
          icon: Center(
            child: Icon(Icons.document_scanner, color: Colors.white,size: 21,
            ),
          ),
          alignment: Alignment.bottomLeft,
          splashColor: Colors.white,
          tooltip: 'report',color: Colors.purple,
          hoverColor: Colors.purple,
        ),)
    ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text('Phone No:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text(appointment.phoneNumber,style: TextStyle(fontSize: 12,),)
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text('Gender:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text(appointment.gender,style: TextStyle(fontSize: 12,),)
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text("",style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text("",style: TextStyle(fontSize: 12,),)
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text('Time:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text(appointment.time,style: TextStyle(fontSize: 12,),)
    ],
    ),
    ),
      Container(height: 40,),
      ElevatedButton(onPressed: ()  {

      },child: Text(
          'Cancel',style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'fontMAIN',
      )
      ),
        style: ElevatedButton.styleFrom(backgroundColor:Colors.red.shade800,shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        )),

      ),
    ],
    ),

    )])
    ))));
  }

}