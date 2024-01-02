import 'package:dp_consultation/PAviweall.dart';
import 'package:dp_consultation/approveddoctor.dart';
import 'package:flutter/material.dart';


class AdminDashboardPage extends StatefulWidget{
  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  get year => 4;
  String role="Pendind Approval";
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
          title: Text('Admin ',style: TextStyle(fontFamily: 'fontMAIN',)),
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
                    role="Pending Approval";
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PAviweall(),
                    ));
                  });
                },
                child: Center(
                  child: Container(
                      width: 220,
                      height: 40,

                      decoration: BoxDecoration(color: role=="Pending Approval"?Colors.purple.shade50:Colors.white,

                          border: Border.all(

                            color: Colors.purple.shade100,
                          )
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.pending_actions_rounded,
                              color: Colors.purple.shade200,
                              size: 24,
                            ),
                            Container(width: 11,),
                            Text('Pending Approval ', style: TextStyle(
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
              ),
              Container(height: 11,),
              InkWell(
                onTap: (){
                  setState((){
                    role="Approved Doctors";
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => approveddoctor(),
                    ));
                  });
                },
                child: Center(
                  child: Container(
                      width: 220,
                      height: 40,

                      decoration: BoxDecoration(color: role=="Approved Doctors"?Colors.purple.shade50:Colors.white,

                          border: Border.all(

                            color: Colors.purple.shade100,
                          )
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.approval_outlined,
                              color: Colors.purple.shade200,
                              size: 24,
                            ),
                            Container(width: 11,),
                            Text('Approved Doctors ', style: TextStyle(
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
              ),

]
      )),

      )));
  }
}

