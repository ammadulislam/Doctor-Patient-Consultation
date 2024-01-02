import 'package:dp_consultation/providers/all_doctors.dart';
import 'package:dp_consultation/providers/global_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class PAviweall extends StatefulWidget{
  @override
  State<PAviweall> createState() => _PAviweallState();
}

class _PAviweallState extends State<PAviweall> {
  // Add this function to your _PAviweallState class
  String doctor='doctor';
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
            title: Text('Pending Approval ',style: TextStyle(fontFamily: 'fontMAIN',)),
          ),
          body:  Consumer<All_doctor_provider>(builder: (context, provider, child){
      if (provider.doc_list.isEmpty) {

        provider.find_doctor(doctor.toString());
        return Center(child: CircularProgressIndicator());
      }else{
        return
        ListView.separated(itemBuilder: (context, index){

           final data = provider.doc_list[index];

          return ListTile(
            leading:Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  shape: BoxShape.circle


              ),
              child: Center(child: Text(data.fullName.substring(0, 1).toUpperCase(), style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w700,)),


              ),),

            title:Text(data.fullName,style: TextStyle(fontWeight: FontWeight.bold,
              fontFamily: 'fontMAIN',
            )),
            subtitle:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data.experience, style: TextStyle(fontWeight: FontWeight.bold,
                fontFamily: 'fontMAIN',
              )),
            ),
            trailing: ElevatedButton(onPressed: ()async{
             int id = data.user_id;
              final response = await http.patch(
                  Uri.parse('${ip}/users/updatestatus?doctorId=$id'));

              if (response.statusCode == 200) {
                print("approved");
                setState(() {
                  provider.find_doctor(doctor.toString());
                });
              }
              else {
                print(response);
                throw Exception('Failed to accept');
              }

            },child: Text(
                'Accept', style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'fontMAIN',

            )


            ),
                style: ElevatedButton.styleFrom(minimumSize: Size(10, 10),shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                ))
            ),
          );



        },

          itemCount: provider.doc_list.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 20,thickness:2,);
          },

        );
            }
      },


        ))));
  }
}


