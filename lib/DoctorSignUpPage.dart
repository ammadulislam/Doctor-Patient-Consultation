import 'package:http/http.dart' as http;
import 'package:dp_consultation/utilities/utlity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'usermodel.dart';
import 'DoctorDashboard.dart';
import 'PatientSignUpPage.dart';
import 'package:flutter/src/material/dropdown.dart';

import '../providers/global_data.dart';
enum ganderGroup{Male, Female}

class DoctorSignupPage extends StatefulWidget{

  @override
  State<DoctorSignupPage> createState() => _DoctorSignupPageState();
}

class _DoctorSignupPageState extends State<DoctorSignupPage> {
  bool _passwordObscured = true;
  String gender='';
  ganderGroup _value=  ganderGroup.Male;
  Future<void> postUserData(
      String fullName,
      String emailAddress,
      String phoneNo,
      String gender,
      String password,
      String image,
      String role,
      String isApproved) async {

     String apiUrl = "$ip/users/usersignup";
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        //'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'fullName': fullNameText.text,
        'emailAddress': emailText.text,
        'phoneNo': phoneText.text,
        'gender': 'male',
        'password': passwordText.text,
        'image': '',
        'role': 'doctor',
        'isApproved':'notapproved'
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Failed to post user data.');
    }
  }
  String? __selectedLocation;

  List<String> _locations = ['Dentist', 'Dermatologist',
    'Gynecologist', 'Nerulogist','Edrocrinologist','Phsychitrist',
    'Medical_Genetic','Family_physician','Audiologist', 'Throat_Specialist'];

  String location='';
String role= 'doctor';
  String approved='notapproved';
  var fullNameText = TextEditingController();

  var emailText = TextEditingController();

  var phoneText = TextEditingController();

  var passwordText = TextEditingController();

  var confirmPasswordText = TextEditingController();

  var specialityText= TextEditingController();

  var ExperienceText= TextEditingController();

  Future<String?> CreateAccount() async {
    String url = '$ip/users/CreateAccount';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['name'] = fullNameText.text;
    request.fields['email'] = emailText.text;
    request.fields['phoneno'] = phoneText.text;
    request.fields['gender'] = gender;
    request.fields['experience'] = ExperienceText.text;
    request.fields['speciality'] = __selectedLocation.toString();
    request.fields['password'] = passwordText.text;
    request.fields['role'] = role.toString();
    request.fields['isApproved'] = approved.toString();

    var response = await request.send();
    if (response.statusCode == 200) {
      utils.flushBarErrorMessage("Your  Account Created Sucessfully",context);
      print(response.stream.bytesToString());
      return response.stream.bytesToString();
    }
    else{
      utils.flushBarErrorMessage("oops,We're sorry",context);
    }
    return null;
  }
  @override
Widget build(BuildContext context){
    return Container(
      height: 755,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/signupbackground.png'),
          fit: BoxFit.cover),),
      child:  Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.purple.shade300,
            title: Text('Doctor', style: TextStyle(fontFamily: 'fontMAIN',)),

          ),




          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: 11,),
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/loginicon.png',
                          ),
                          backgroundColor: Colors.purple.shade300,
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
                        ),
                      ],
                    ),),
                  Container(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(

                        onTap: (){
                          setState((){
                            role="doctor";

                          });
                        },

                        child: Container(
                            width: 100 ,
                            height: 40,

                            decoration: BoxDecoration(color: role=="doctor"?Colors.purple.shade100:Colors.purple.shade200,
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
                            role="patient";
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PatientSignUppage(),
                            ));
                          });
                        },
                        child: Container(
                            width: 100 ,
                            height: 40,

                            decoration: BoxDecoration(color: role=="patient"?Colors.purple.shade100:Colors.purple.shade200,
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



                  Container(height: 11,),
                  TextField(
                      controller: fullNameText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Full Name',

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                              color: Colors.purple.shade200,
                              width: 3),

                        ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: BorderSide(
                                color: Colors.black

                            )

                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.purple.shade200,),

                      )

                  ),

                  Container(height: 8,),
                      TextField(
                          controller: emailText,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical:2),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter Email",
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26),
                              borderSide: BorderSide(
                                  color: Colors.purple.shade200,
                                  width: 3),

                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(26),
                                borderSide: BorderSide(
                                    color: Colors.black

                                )

                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.purple.shade200,),

                          )

                      ),

                  Container(height: 8,),
                      TextField(
                          controller: phoneText,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0.5),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Phone No",
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26),
                              borderSide: BorderSide(
                                  color: Colors.purple.shade200,
                                  width: 3),

                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(26),
                                borderSide: BorderSide(
                                    color: Colors.black

                                )

                            ),
                            prefixIcon: Icon(Icons.phone, color: Colors.purple.shade200,),

                          )),
                  Container(height: 8,),
                  Container(
                    width: 600,
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

                      ), ),
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
                                          gender="Female";
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
                  controller: ExperienceText,

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0.5),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Experience',
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(
                          color: Colors.purple.shade200,
                          width: 3),

                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )

                    ),
                    prefixIcon: Icon(Icons.add_business, color: Colors.purple.shade200,),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.plus_one_rounded,color: Colors.purple.shade200,),
                      onPressed: (){

                      },

                    ),

                  )

              ),

                  Container(height: 8,),
              Container(
                width: 600,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,

                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: DropdownButton
                <String>(
                       hint: Padding(
                         padding: const EdgeInsets.all(8.40),
                         child: Text("Select Your Speacility",style: TextStyle(fontSize:15, color: Colors.black54 )),
                       ),
                  value: __selectedLocation,
                  icon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.arrow_drop_down, color: Colors.purple.shade300),

                  ),

                  iconSize: 25,
                  elevation: 16 ,
                  isExpanded: true,
                  style: TextStyle(color: Colors.black54),

                  onChanged: (newValue) {
                    setState(() {
                      __selectedLocation = newValue!;
                                        });
                  },
                  items: _locations
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(value, style: TextStyle(fontSize:15)),

                      ),

                    );
                  }).toList(),

                ),
              ),


              Container(height: 8,),
                      TextField(
                          controller: passwordText,
                          obscureText: _passwordObscured,
                          //obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0.5),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Password',
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26),
                              borderSide: BorderSide(
                                  color: Colors.purple.shade200,
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
                            contentPadding: EdgeInsets.symmetric(vertical: 0.5),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26),
                              borderSide: BorderSide(
                                  color: Colors.purple.shade200,
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

                      ElevatedButton(
                          onPressed: (){

                                String fullName = fullNameText.text.trim();
                                String email = emailText.text.trim();
                                String phone = phoneText.text.trim();
                                String experience = ExperienceText.text.trim();
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

                                // Validate experience
                                else if (experience.isEmpty) {
                                  utils.flushBarErrorMessage("Please enter your experience", context);
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
                          fontFamily: 'fontMAIN'

                      )
                      ),
                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                          ))
                      ),

                ]

              ),
            ),
          ),

    ));
}
}




