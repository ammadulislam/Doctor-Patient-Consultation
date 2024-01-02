
import 'package:dp_consultation/DoctorSignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dp_consultation/utilities/utlity.dart';


import 'usermodel.dart';
import 'package:email_validator/email_validator.dart';

import '../providers/global_data.dart';
enum ganderGroup{Male, Female}
class PatientSignUppage extends StatefulWidget{
  String gender='';
  @override
  State<PatientSignUppage> createState() => _PatientSignUppageState();
}

class _PatientSignUppageState extends State<PatientSignUppage> {
  bool _passwordObscured = true;
  ganderGroup _value=  ganderGroup.Male;
  String role = 'patient';
String gender='';
  var FullNameText = TextEditingController();

  var emailText = TextEditingController();

  var phoneText = TextEditingController();

  var passwordText = TextEditingController();

  var confirmPasswordText = TextEditingController();
  Future<String?> CreateAccount() async {
    String url = '$ip/users/CreateAccount';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['name'] = FullNameText.text;
    request.fields['email'] = emailText.text;
    request.fields['phoneno'] = phoneText.text;
    request.fields['gender'] = gender;
    request.fields['password'] = passwordText.text;
    request.fields['role'] = role.toString();
    var response = await request.send();
    if (response.statusCode == 200) {
      utils.flushBarErrorMessage("Your Created Sucessfully",context);
    }
    else {
      utils.flushBarErrorMessage("Oops,We're Sorry",context);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 755,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/signupbackground.png'),
          fit: BoxFit.cover),),

     child: Scaffold(
       backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.purple.shade300,
            title: Text('Patient',style: TextStyle(fontFamily: 'fontMAIN',)),

          ),
                    body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                 children: [
                   Container(height: 11,),
                   Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         CircleAvatar(
                           backgroundImage: AssetImage('assets/images/loginicon.png',
                           ),
                           backgroundColor: Colors.cyan.shade200,
                           radius: 20,
                         ),
               Container(width: 11,),
               Text( "Sign Up", style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'fontMAIN',
              ),
               )]
               ),
              ),


                   Container(height:50,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       InkWell(

                         onTap: (){
                           setState((){
                             role="Doctor";
                             Navigator.push(context, MaterialPageRoute(
                               builder: (context) => DoctorSignupPage()
                             ));
                           });
                         },
                         child: Container(
                             width: 100 ,
                             height: 40,

                             decoration: BoxDecoration(color: role=="Doctor"?Colors.purple.shade100:Colors.purple.shade200,
                                 borderRadius: BorderRadius.circular(26),
                                 border: Border.all(
                                   width: 3,
                                   color: Colors.purple.shade300,

                                 )

                             ),
                             child: Center(
                               child: Text(' Doctor', style: TextStyle(
                                 fontStyle: FontStyle.italic,
                                 color: Colors.black,
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 fontFamily: 'fontMAIN',
                               ),
                               ),
                             )
                         ),),

                       InkWell(

                         onTap: (){
                           setState((){
                             role="Patient";

                           });
                         },
                         child: Container(
                             width: 100,
                             height: 40,

                             decoration: BoxDecoration(color: role=="Patient"?Colors.purple.shade100:Colors.purple.shade200,
                                 borderRadius: BorderRadius.circular(26),
                                 border: Border.all(
                                   width: 3,
                                   color: Colors.purple.shade300,
                                 )
                             ),
                             child: Center(
                               child: Text(' Patient', style: TextStyle(
                                 fontStyle: FontStyle.italic,
                                 color: Colors.black,
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 fontFamily: 'fontMAIN',
                               ),
                               ),
                             )
                         ),
                       )
                     ],
                   ),


                   Container(height: 15,),
                  TextField(
                      controller: FullNameText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Full Name",
                        isDense: true,
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                              color: Colors.purple.shade300,
                              width: 3),

                        ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: BorderSide(
                                color: Colors.black

                            )

                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.purple.shade300,),

                      )
                  ),

                   Container(height: 8,),
                  TextField(
                      controller: emailText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter Email",
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                              color: Colors.purple.shade300,
                              width: 3),

                        ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: BorderSide(
                                color: Colors.black

                            )

                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.purple.shade300,),

                      )

                  ),

                   Container(height: 8,),
                  TextField(
                      controller: phoneText,
                      decoration: InputDecoration(

                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Phone No",
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                              color: Colors.purple.shade300,
                              width: 3),

                        ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: BorderSide(
                                color: Colors.black

                            )

                        ),
                        prefixIcon: Icon(Icons.phone, color: Colors.purple.shade300,),

                      )

                  ),

                   Container(height: 8,),
                   Container(
                     width: 330,
                     height: 48,
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.black54),
                       borderRadius: BorderRadius.circular(26),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(11.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Expanded(

                             child: Text('Choose Gender', style: TextStyle(fontSize: 15, color: Colors.black54,


                              ),),
                           ),
                           Row(
                             children: [
                               Radio(value: ganderGroup.Male,

                                   groupValue: _value,
                                   onChanged: (ganderGroup? val){
                                     setState(() {
                                       gender="male";
                                       _value = val!;
                                     });
                                   }
                               ),
                               Text('Male',
                                   style: TextStyle(fontSize: 12,)),
                               Row(
                                 children: [
                                   Radio(value: ganderGroup.Female,
                                       groupValue: _value,
                                       onChanged: (ganderGroup? val){
                                         setState(() {
                                           gender="female";
                                           _value = val!;
                                         });
                                       }
                                   ),
                                 ],
                               ),
                               Text('Female',
                                   style: TextStyle(fontSize: 12,)),

                             ],
                           ),

                         ],
                       ),
                     ),
                   ),
                   Container(height: 8,),
                   TextField(

                      controller: passwordText,
                       obscureText: _passwordObscured,
                     // obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Password',
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                              color: Colors.purple.shade300,
                              width: 3),

                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: BorderSide(
                              color: Colors.black,
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
                   Container(height: 8,),
                  TextField(
                      controller: confirmPasswordText,
                      obscureText: _passwordObscured,
                     // obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirm Password',
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                              color: Colors.purple.shade300,
                              width: 3),

                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: BorderSide(
                              color: Colors.black,
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
                   Container(height: 11,),
                  ElevatedButton(onPressed: ()  {
    String fullName = FullNameText.text.trim();
    String email = emailText.text.trim();
    String phone = phoneText.text.trim();
    String password = passwordText.text;
    String confirmPassword = confirmPasswordText.text;

    // Validate full name
    if (fullName.isEmpty) {
    utils.flushBarErrorMessage("Please enter your name", context);
    }

    // Validate email
    else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    utils.flushBarErrorMessage("Please enter a valid email address", context);
    }

    // Validate phone number
    else if (!RegExp(r'^\d{11}$').hasMatch(phone)) {
    utils.flushBarErrorMessage("Please enter a valid phone number", context);
    }

    // Validate password
    else if (password.isEmpty) {
    utils.flushBarErrorMessage("Please enter a password", context);
    } else if (password.length < 8) {
    utils.flushBarErrorMessage("Password must be at least 8 characters long", context);
    } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)) {
    utils.flushBarErrorMessage("Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character (!@#\$&*~)", context);
    }

    // Validate confirm password
    else if (confirmPassword.isEmpty) {
    utils.flushBarErrorMessage("Please confirm your password", context);
    } else if (password != confirmPassword) {
    utils.flushBarErrorMessage("Passwords do not match", context);
    }

    // All validations passed
    else {
    CreateAccount();
    }
                  },child: Text(
                      'SignUp',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                      fontFamily: 'fontMAIN',
                  )
                  ),
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                      ))
                  ),
                ],
              ),

            ),

          )



      ));



  }

}















