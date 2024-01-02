import 'package:flutter/material.dart';

class docprofile extends StatelessWidget{
  int id;
  String name;
  String email;
  String phonenumber;
  String gender;
  String experience;
  String speciality;
  docprofile(this.id,this.name,this.email,this.phonenumber,this.gender,this.experience,this.speciality);

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
    title: Text('Profile', style: TextStyle(fontFamily: 'fontMAIN',)),
    ),
    body: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(height: 15,),
    Container(
    child:Center(
    child: Text( name, style: TextStyle(
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
    Text(email,style: TextStyle(fontSize: 12,),),
    Container(width: 40,),
    Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
    color: Colors.purple.shade200,
    shape: BoxShape.circle


    ),
    child: Center(child: Text(name.substring(0, 1).toUpperCase(), style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.w700,)),

    ))],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text('Phone No:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text(phonenumber,style: TextStyle(fontSize: 12,),)
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text('Gender:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text(gender,style: TextStyle(fontSize: 12,),)
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text('Experience:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text(experience,style: TextStyle(fontSize: 12,),)
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.8),
    child: Row(

    children: [

    Text('Speciality:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
    Container(width: 12,),
    Text(speciality,style: TextStyle(fontSize: 12,),)
    ],
    ),
    ),

    ],
    )
    )
    ],
    ),
    )
    )));
  }

}