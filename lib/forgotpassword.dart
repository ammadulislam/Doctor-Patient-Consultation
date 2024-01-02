import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
class forgotpassword extends StatefulWidget{
  Future<String?> login(String email) async
  {
    String url = 'http://192.168.0.114/Hospital_System_API/api/Hospital/userlogin?email=EmailText';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
  }
  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  var EmailText = TextEditingController();

  var NewPasswordText = TextEditingController();

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
           title: Text('Reset Password ',style: TextStyle(fontFamily: 'fontMAIN',)),
         ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child:SingleChildScrollView(
      child: Column(
        children: [
          Container(height: 30,),
          Container(
            child:Text( "Reset Your Password", style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'fontMAIN',
            ),
            ),

          ),
          Container(height: 11,),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/resetpassword.png',
            ),
            backgroundColor: Colors.white,
            radius: 30,
          ),
          Container(height: 30,),
          Container(
            child:Text( "Enter Your new password is below", style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.purple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'fontMAIN',
            ),
            ),

          ),
          Container(height: 50,),
          TextField(
              controller: EmailText,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Email',
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                      color: Colors.purple.shade100,
                      width: 3),

                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )

                ),
                prefixIcon: Icon(Icons.lock, color: Colors.purple.shade100,),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye,color: Colors.purple.shade100,),
                  onPressed: (){

                  },

                ),

              )

          ),
          Container(height: 11,),
          TextField(
              controller: NewPasswordText,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'New Password',
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                      color: Colors.purple.shade100,
                      width: 3),

                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )

                ),
                prefixIcon: Icon(Icons.lock, color: Colors.purple.shade100,),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye,color: Colors.purple.shade100,),
                  onPressed: (){

                  },

                ),

              )

          ),
          Container(height: 40,),
          ElevatedButton(onPressed: (){









          },child: Text(
              'Reset Password',style: TextStyle(
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
          Container(height: 20,),
          Container(
            width: 200,
            height: 50,

          )
        ],
      ),
    ),)

    )));
  }
}