
import 'package:dp_consultation/DoctorDashboard.dart';
import 'package:dp_consultation/DoctorSignUpPage.dart';
import 'package:dp_consultation/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dp_consultation/utilities/utlity.dart';

//import 'package:shared_preferences/shared_preferences.dart';


import '../AdminDashboardPage.dart';
import '../PatientDashboard.dart';

class login_forms extends StatefulWidget {

  const login_forms({super.key, required this.title});
  final String title;
  @override
  State<login_forms> createState() => _login_formsState();
}

class _login_formsState extends State<login_forms> {
  bool _passwordObscured = true;
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  var emailText = TextEditingController();
  var passwordText = TextEditingController();
  Future<String?> login(String email, String pass) async
  {
    String url = 'http:/192.168.0.114/Hospital_System_API/api/Hospital/userlogin?email=$email&password=$pass';
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
          fit: BoxFit.cover)
      ),


      child : Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.purple.shade300,
            title: Text(' Telemedicine App', style: TextStyle(fontFamily: 'fontMAIN',),),
          ),
          body: Padding(

              padding: const EdgeInsets.all(8.0),
              child:SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: 15,),
                      Container(
                        child:Text( "Welcome", style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'fontMAIN',
                        ),
                        ),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 150,),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/loginicon.png',
                            ),
                            backgroundColor: Colors.cyan.shade200,
                            radius: 20,
                          ),
                          Text(
                            " Login ", style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'fontMAIN',
                            color: Colors.purple,

                          ),
                          ),
                        ],
                      ),
                      Column(

                        children: [
                          Container(height: 11,),
                          TextField(
                              controller: emailText,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Enter Email",
                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(26),
                                  borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 3),

                                ),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(26),
                                    borderSide: BorderSide(
                                        color: Colors.purple

                                    )

                                ),
                                prefixIcon: Icon(Icons.email, color: Colors.purple.shade200,),

                              )

                          ),
                        ],
                      ),

                      Column(

                        children: [
                          Container(height: 11,),

                          TextField(
                              obscureText: _passwordObscured,
                              controller: passwordText,
                              //obscureText: true,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 6),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter Password',
                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(26),
                                  borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 3),

                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(26),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                    )

                                ),
                                prefixIcon: Icon(Icons.lock, color: Colors.purple.shade200,),
                                suffixIcon: IconButton(
                                  icon: Icon(_passwordObscured ? Icons.visibility_off : Icons.visibility, color: Colors.purple.shade200,),
                                  onPressed: (){
                                    setState(() {
                                      _passwordObscured = !_passwordObscured;
                                    });
                                  },
                                ),

                              )

                          ),
                        ],
                      ),
                      Column(

                        children: [

                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => forgotpassword(),
                            ));

                          },
                            child:Text( "Forgot Password?", style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontFamily: 'fontMAIN',
                                color: Colors.grey,fontSize:13 ),
                            ),),
                        ],

                      ),
                      ElevatedButton(onPressed: ()async{

                        print("-------------------->CHECK__________________");
                        String uEmail = emailText.text;
                        String uPassword = passwordText.text;
                        if (!emailRegex.hasMatch(uEmail)) {
                          utils.flushBarErrorMessage("Please Enter a valid Email",context);
                          return;
                        }

                        if (emailText.text.isEmpty) {
                          utils.flushBarErrorMessage("Please Enter Your Email",context);
                          return;
                        }

                        if (passwordText.text.isEmpty) {
                          utils.flushBarErrorMessage("Please Enter Your Password",context);
                          return;
                        }
                        print("$uEmail     $uPassword");
                        String? response=await login(uEmail,uPassword);
                        print("response$response");

                        if(response==null)
                        {
                          print('There is ERROR -------->>');
                        }
                        else if(response=="\"false\"")
                        {
                          print('Incorrect Email or Password --------->>');
                        }
                        else if(response!=null && response!="\"Not Found\"" ){
                          dynamic map = jsonDecode(response);
                          int id = map["user_id"];
                          String name=map["full_name"];
                          String role=map["role"];
                          String email=map["email_address"];
                          String phno=map["phone_no"];

                          String gender=map["gender"];
                          print(role);
                          if(role=="doctor")
                          {
                            String experience=map["experience"];
                            String speciality=map["speciality"];
                            String isApproved=map["isApproved"];

                            print(isApproved);
                            if( isApproved=="approved") {
                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                              // prefs.setString('userRole', 'doctor');
                              // prefs.setBool('isLoggedIn', true);

                              // User u=User.fromMap(map);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return DoctorDashboard(id,name,email,phno,gender,experience,speciality);
                                  }));
                            }
                            else {
                              utils.flushBarErrorMessage("Sorry,Admin hasn't approved Your profile yet", context);
                            }
                          }
                          else if(role=="patient")
                          {
                            // SharedPreferences prefs=await SharedPreferences.getInstance();
                            // prefs.setString('userRole','patient');
                            // prefs.setBool('isLoggedIn', true);
                            // User u=User.fromMap(map);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context){
                                  return patientDashboard(id,name);
                                }));

                          }
                          else if(role=="Admin")
                          {
                            // SharedPreferences prefs=await SharedPreferences.getInstance();
                            // prefs.setString('userRole','admin');
                            //  prefs.setBool('isLoggedIn', true);
                            //User u=User.fromMap(map);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context){
                                  return AdminDashboardPage();
                                }));
                          }
                        }
                        else{
                          print("Any Issue");
                        }

                      },child: Text(
                          'Sign In', style: TextStyle(
                        fontFamily: 'fontMAIN',
                      )
                      )
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DoctorSignupPage(),
                        ));

                      },

                        child: Text(
                          "Create Account", style: TextStyle(

                          fontFamily: 'fontMAIN',
                          color: Colors.purple,
                          backgroundColor: Colors.black12,
                        ),
                        ),),


                    ],

                  )))),
    ) ;

  }
}
