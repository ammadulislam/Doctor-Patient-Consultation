
import 'dart:convert';

import 'package:dp_consultation/providers/all_doctors.dart';
import 'package:dp_consultation/providers/speciality_provider.dart';
import 'package:dp_consultation/splashscreen.dart';
import 'package:dp_consultation/utilities/appointmentdetail/schedule_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'User.dart';



import 'PatientDashboard.dart';



void main() {
  runApp(
      MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (_)=>speciality()),
          ChangeNotifierProvider(create: (_)=>All_doctor_provider()),
          ChangeNotifierProvider(create: (_)=>ScheduleProvider())],
        child: MaterialApp(
          home:MyApp())));


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: splashscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  // void initState() {
  //   super.initState();
  //   checkLoginAndNavigate();
  // }

  // Future<void> checkLoginAndNavigate() async {
  //   share_pref_checkLogin s=share_pref_checkLogin();
  //   final isLoggedIn = await s.isLoggedIn();
  //   final userRole = await s.getUserRole();
  //
  //   if (isLoggedIn) {
  //     switch (userRole) {
  //       case 'doctor':
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DoctorDashboard()));
  //         break;
  //       case 'patient':
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>patientDashboard()));
  //         break;
  //
  //       default:
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login_forms(title: '',)));
  //     }
  //   } else {
  //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login_forms(title: '',)));
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return splashscreen();
    dispose();


  }
}


