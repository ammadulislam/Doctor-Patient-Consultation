import 'package:flutter/material.dart';

class patient_report extends StatefulWidget{
  @override
  State<patient_report> createState() => _patient_reportState();
}

class _patient_reportState extends State<patient_report> {
  @override
  var arrNames=['Sabahat Nosheen','Saba Perween'];
  Widget build(BuildContext context) {
    return Container(
        height: 755,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/signupbackground.png'),
    fit: BoxFit.cover),),

    child:  Center(child: Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    backgroundColor: Colors.purple.shade300,
    title: Text('Reports',style: TextStyle(fontFamily: 'fontMAIN',)),
    ),
        body: ListView.separated(itemBuilder: (context, index){
      return ListTile(
      );
        },
          itemCount: arrNames.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 30,thickness:2,);
          },

        ),
    )));
  }
}