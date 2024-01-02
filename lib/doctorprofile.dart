import 'package:dp_consultation/providers/global_data.dart';
import 'package:dp_consultation/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'approveddoctor.dart';
class doctorprofile extends StatelessWidget {

  final Aproveddoctors data;
  const doctorprofile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 755,
        decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/signupbackground.png'),
            fit: BoxFit.cover),),
        child: Center(child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.purple.shade300,
            title: Text('Profile', style: TextStyle(fontFamily: 'fontMAIN',)),
          ),

         body: Padding(
           padding: const EdgeInsets.all(12.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(height: 15,),
               Container(
                  child:Center(
                    child: Text(data.fullName, style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'fontMAIN',
                    ),
                    ),
                  ),),
               Container(height: 11,),
               CircleAvatar(
                 backgroundImage: AssetImage('assets/images/loginicon.png',
                 ),
                 backgroundColor: Colors.purple.shade200,
                 radius: 40,

               ),
           Container(height: 11,),
           Container(
             width: 300 ,
             height: 400,

             decoration: BoxDecoration(
                 color: Colors.purple.shade50,

                 borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                   bottomRight: Radius.circular(50),

                 ),

             ),
               child: Column(

                 children: [
                   Container(height: 30,),
                   Container(
                     child: Padding(
                       padding: const EdgeInsets.all(8.8),
                       child: Row(

                         children: [

                           Text('Email:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
                           Container(width: 12,),
                           Text(data.emailAddress,style: TextStyle(fontSize: 12,),),
                       Container(width: 40,),
                       Container(
                       height: 40,
                       width: 40,
                       decoration: BoxDecoration(
                           color: Colors.purple.shade200,
                           shape: BoxShape.circle


                       ),
                       child: Center(child: Text(data.fullName.substring(0, 1).toUpperCase(), style: TextStyle(color: Colors.white,
                         fontWeight: FontWeight.w700,)),

                       ))],
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.8),
                     child: Row(

                       children: [

                         Text('Phone No:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
                         Container(width: 12,),
                         Text(data.phoneNo,style: TextStyle(fontSize: 12,),)
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.8),
                     child: Row(

                       children: [

                         Text('Gender:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
                         Container(width: 12,),
                         Text(data.gender,style: TextStyle(fontSize: 12,),)
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.8),
                     child: Row(

                       children: [

                         Text('Experience:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
                         Container(width: 12,),
                         Text(data.experience,style: TextStyle(fontSize: 12,),)
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.8),
                     child: Row(

                       children: [

                         Text('Speciality:',style: TextStyle(fontSize: 15,fontFamily: 'fontMAIN',)),
                         Container(width: 12,),
                         Text(data.speacility,style: TextStyle(fontSize: 12,),)
                       ],
                     ),
                   ),
                   Container(height: 40,),
                   ElevatedButton(onPressed: () async {
                     int id = data.user_id;
                     final response = await http.get(
                         Uri.parse('${ip}/users/delete_doctor?id=$id'));
print(id);
print(response);
                     if (response.statusCode == 200) {
                       print("Deleted");
                     }
                     else {
                       print(response);
                       throw Exception('Failed to Delete');
                     }
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context) => approveddoctor()));
                   },child: Text(
                       'Remove',style: TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'fontMAIN',
                   )
                   ),
                       style: ElevatedButton.styleFrom(backgroundColor:Colors.red.shade800,shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(24)
                       )),

                   ),
                 ],
               )
           )
             ],
           ),
         ),
        )));
  }
}


