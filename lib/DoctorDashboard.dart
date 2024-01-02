import 'package:dp_consultation/docprofile.dart';
import 'package:dp_consultation/upcomingevents.dart';
import 'package:dp_consultation/viwescheduale.dart';
import 'package:flutter/material.dart';


import 'doctorschedual.dart';

class DoctorDashboard extends StatefulWidget{
  int id;
  String name;
  String email;
  String phonenumber;
  String gender;
  String experience;
  String speciality;
  DoctorDashboard(this.id,this.name,this.email,this.phonenumber,this.gender,
      this.experience,this.speciality);

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {

  String role='Upcoming Events';

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
              title: Text('Doctor ',style: TextStyle(fontFamily: 'fontMAIN',)),
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
      Container(height: 200,),
      InkWell(
        onTap: (){
          setState((){
            role="Upcoming Event";
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => upcomingevent(widget.name,widget.id),
            ));
          });
        },
        child: Container(
            width: 200,
            height: 40,

            decoration: BoxDecoration(color: role=="Upcoming Event"?Colors.purple.shade50:Colors.white,

                border: Border.all(

                  color: Colors.purple.shade100,
                )
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.upcoming_outlined,
                    color: Colors.purple.shade200,
                    size: 24,
                  ),
                  Container(width: 11,),
                  Text(' Upcoming Event', style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'fontMAIN',
                  ),
                  ),
                ],
              ),
            )
        ),
      ),

      Container(height: 290,),

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
      ]
    ),
    ) ),
        ) );
  }
}