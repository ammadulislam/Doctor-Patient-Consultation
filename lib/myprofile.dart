import 'package:dp_consultation/providers/login_form.dart';
import 'package:dp_consultation/utilities/reports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myprofile extends StatefulWidget{
  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  String role = 'My Provider';
  @override
  Widget build(BuildContext context) { return Container(
      height: 755,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/signupbackground.png'),
          fit: BoxFit.cover),),
      child:  Center(child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade300,
          title: Text('profile', style: TextStyle(fontFamily: 'fontMAIN',),),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),

            child: Column(
                children: [

                  Container(height: 40,),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/patient.jpg',
                    ),
                    backgroundColor: Colors.purple.shade200,
                    radius: 50,

                  ),
                  Container(height: 11,),
                  Container(
                    child:Text( "Sabahat Nosheen", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'fontMAIN',
                    ),
                    ),),
                  Container(height: 60,),
                  InkWell(
                    onTap: (){
                      setState((){
                        role="My Provider";

                      });
                    },
                    child: Container(
                        width: 500 ,
                        height: 50,

                        decoration: BoxDecoration(color: role=="My Provider"?Colors.purple.shade50:Colors.white,

                            border: Border.all(

                              color: Colors.purple.shade100,
                            )
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.purple.shade200,
                                size: 24,
                              ),
                              Container(width: 11,),
                              Text('My Provider ', style: TextStyle(
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

                  Container(height: 11,),
                  InkWell(
                    onTap: (){
                      setState((){
                        role="Reports";
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => ReportPage()
                        ));

                      });
                    },
                    child: Container(
                        width: 500 ,
                        height: 50,

                        decoration: BoxDecoration(color: role=="Reports"?Colors.purple.shade50:Colors.white,

                            border: Border.all(

                              color: Colors.purple.shade100,
                            )
                        ),
                        child: Center(

                           child: Row(
                             children: [
                               Icon(
                                 Icons.receipt,
                                 color: Colors.purple.shade200,
                                 size: 24,
                               ),
                               Container(width: 11,),
                              Text('Reports ', style: TextStyle(
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
                  Container(height: 11,),
                  InkWell(
                    onTap: (){
                      setState((){
                        role="Logout";
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => login_forms(title: "Telemedicine App")
                        ));

                      });
                    },
                    child: Container(
                        width: 500 ,
                        height: 50,

                        decoration: BoxDecoration(color: role=="Logout"?Colors.purple.shade50:Colors.white,

                            border: Border.all(
                             
                              color: Colors.purple.shade100,
                            )
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.lock,
                                color: Colors.purple.shade200,
                                size: 24,
                              ),
                              Container(width: 11,),
                              Text('Logout ', style: TextStyle(
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
                  )
                ]
            )),
      )));


  }
}
