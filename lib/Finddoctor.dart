import 'dart:async';
import 'dart:convert';

import 'package:dp_consultation/providers/speciality_provider.dart';
import 'package:dp_consultation/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


import 'Dprofile.dart';
import 'User.dart';
class finddoctor extends StatefulWidget{
  String find;
  int id;
  String name;
  finddoctor(this.id,this.name,this.find);
  @override
  State<finddoctor> createState() => _finddoctorState();

}

class _finddoctorState extends State<finddoctor> {
  List<Userspec> data = [];
  bool _showProgressIndicator = true;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        _showProgressIndicator = false;
      });
    });
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
    title: Text('Find Doctor ',style: TextStyle(fontFamily: 'fontMAIN',)),
    ),
        body:
        Consumer<speciality>(builder: (context, provider, child){
        provider.find_doctor(widget.find);
        return provider.isLoading?
       _showProgressIndicator?  Center(child: CircularProgressIndicator()):
       ListView.separated(itemBuilder: (context,index)
       {
         final data =provider.spec_list[index];
         return ListTile(
           leading:Container(
             height: 50,
             width: 50,
             decoration: BoxDecoration(
                 color: Colors.purple.shade100,
                 shape: BoxShape.circle


             ),
             child: Center(child: Text(data.fullName.substring(0, 1).toUpperCase(), style: TextStyle(color: Colors.white,
               fontWeight: FontWeight.w700,)),


             ),),
           title: Text(data.fullName, style: TextStyle(
             fontFamily: 'fontMAIN',),),
           subtitle: Text(data.experience,style: TextStyle(
             fontFamily: 'fontMAIN',),),
           trailing:  OutlinedButton(

             style: OutlinedButton.styleFrom(
               minimumSize: Size(5, 20),
               side: BorderSide(color: Colors.purple.shade100, width: 2, ),) ,

             onPressed: (){
               Navigator.push(context, MaterialPageRoute(
                 builder: (context) => dprofile(widget.id,widget.name,data:data),
               ));

             },



             child: Text(
               "View Profile", style: TextStyle( fontSize: 10,
               fontFamily: 'fontMAIN',
               color: Colors.black,
             ),
             ),

           ),
         );
       },
         itemCount: provider.spec_list.length,
         separatorBuilder: (BuildContext context, int index) {
           return Divider(height: 20,thickness:2,);
         },
       ):Text('no doctor');

        }
        ),
    ),
    ));

  }
}