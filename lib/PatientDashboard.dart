import 'package:dp_consultation/selectspeciality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'myprofile.dart';
//import 'myprofile.dart';
class patientDashboard extends StatefulWidget{
  int id;
  String name;
  patientDashboard(this.id,this.name);
  @override
  State<patientDashboard> createState() => _patientDashboardState();
}

class _patientDashboardState extends State<patientDashboard> {
  String role= 'Myself';
  @override
  Widget build(BuildContext context) {
   return Container(
       height: 755,
       decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/signupbackground.png'),
           fit: BoxFit.cover),),
           child:  Center(
               child: Scaffold(
                 backgroundColor: Colors.transparent,
             appBar: AppBar(
               backgroundColor: Colors.purple.shade300,
               title: Text('Patient',style: TextStyle(fontFamily: 'fontMAIN',)),

             ),

             body: Padding(
    padding: const EdgeInsets.all(8.0),

    child: Column(
    children: [
    Container(height: 11,),
    Container(
    child:Text( "Dashboard", style: TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'fontMAIN',
    ),
    ),),
    Container(height: 65,),
    Text('Appointment For',  style: TextStyle( fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,color: Colors.purple,
      fontFamily: 'fontMAIN',
    ),
    textAlign: TextAlign.left,),
      Container(height: 35,),
      InkWell(
        onTap: (){
          setState((){
            role="Myself";
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => selectspeciality(widget.id,widget.name,
              ),
            ));
          });
        },
        child: Container(
          width:  450,
          height:  50,

            decoration: BoxDecoration( color: role=="Myself"?Colors.purple.shade50:Colors.white,

                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40),


                ),
                border: Border.all(
                    width: 3,
                    color: Colors.purple.shade100
                )
            ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/patient.jpg',
                    ),
                    backgroundColor: Colors.cyan.shade200,
                    radius: 50
                ),

              ),

        Text( 'Myself' , style: TextStyle( fontSize: 18,fontFamily: 'fontMAIN',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),),
            ],
          ),

          ),
      ),
      Container(height: 20,),
      InkWell(
        onTap: (){
          setState((){
            role="My child";
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => selectspeciality(widget.id,widget.name),
            ));
          });
        },
        child: Container(
          width:  450,
          height:  50,

          decoration: BoxDecoration(color: role=="My child"?Colors.purple.shade50:Colors.white,

              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40),


              ),
              border: Border.all(
                  width: 3,
                  color: Colors.purple.shade100
              )
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/child.png',

                    ),
                    backgroundColor: Colors.purple.shade300,
                    radius: 50
                ),

              ),
        Text( 'My child' , style: TextStyle( fontSize: 18,fontFamily: 'fontMAIN',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),),
            ],
          ),

        ),
      ),
      Container(height: 20,),
      InkWell(
        onTap: (){
          setState(() {
            role="Other";
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => selectspeciality(widget.id,widget.name),
            ));
          });
        },
        child: Container(
          width:  450,
          height:  50,

          decoration: BoxDecoration(color: role=="Other"?Colors.purple.shade50:Colors.white,

              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40),


              ),
              border: Border.all(
                  width: 3,
                  color: Colors.purple.shade100

              )
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/other.png',
                    ),
                    backgroundColor: Colors.purple.shade300,
                    radius: 50
                ),

              ),
           Text( 'Others' , style: TextStyle( fontSize: 18,fontFamily: 'fontMAIN',
             fontWeight: FontWeight.w700,
             fontStyle: FontStyle.italic,
           ),),

             ],

          ),

        ),
      ),
      Container(height: 200),
      Container(
        width: 500,
        height: 50,
        color: Colors.purple.shade300,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {

              },
                icon: Icon(Icons.add_home_work_rounded, color: Colors.white,size: 30,
                ),
                alignment: Alignment.bottomLeft,
                splashColor: Colors.purple,
                tooltip: 'Home',
                hoverColor: Colors.purple,
              ),
             Container(height: 80,),
              IconButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => myprofile(),
                ));

              },
                icon: Icon(Icons.person_pin, color: Colors.white,size: 30,
                ),
                alignment: Alignment.bottomRight,
                splashColor: Colors.purple,
                   tooltip: 'profile',
                ),
            ],
          ),
        ),
      )

    ]
    )),
    ))  );
  }
}