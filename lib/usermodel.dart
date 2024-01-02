// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

Userspec userspecFromMap(String str) => Userspec.fromMap(json.decode(str));
String userspecToMap(User data) => json.encode(data.toMap());
class Userspec {
  Userspec(

  );
   late int user_id;
  late String fullName;
  late String emailAddress;
  late String phoneNo;
  late String gender;
  late String experience;
  late String speacility;
  late String role;
  late String isApproved;

   Userspec.fromMap(Map<String, dynamic> json){
     user_id=json["user_id"];
     fullName= json["full_name"];
     emailAddress= json["email_address"];
     phoneNo= json["phone_no"];
     gender= json["gender"];
     experience= json["experience"];
     speacility= json["speciality"];
     role= json["role"];
     isApproved=json["isApproved"];

   }

  Map<String, dynamic> toMap() =>
      {
        "user_id":user_id,
        "full_name": fullName,
        "email_address": emailAddress,
        "phone_no": phoneNo,
        "gender": gender,
        "experience": experience,
        "speacility": speacility,
        "role": role,
        "isApproved":isApproved
      };
}

Aproveddoctors approveddoctorsFromMap(String str) => Aproveddoctors.fromMap(json.decode(str));
String approveddoctors(User data) => json.encode(data.toMap());
class Aproveddoctors {
  Aproveddoctors(

      );
  late int user_id;
  late String fullName;
  late String emailAddress;
  late String phoneNo;
  late String gender;
  late String experience;
  late String speacility;
  late String role;
  late String isApproved;

  Aproveddoctors.fromMap(Map<String, dynamic> json){
    user_id=json["user_id"];
    fullName= json["full_name"];
    emailAddress= json["email_address"];
    phoneNo= json["phone_no"];
    gender= json["gender"];
    experience= json["experience"];
    speacility= json["speciality"];
    role= json["role"];
    isApproved=json["isApproved"];

  }

  Map<String, dynamic> toMap() =>
      {
        "user_id":user_id,
        "full_name": fullName,
        "email_address": emailAddress,
        "phone_no": phoneNo,
        "gender": gender,
        "experience": experience,
        "speacility": speacility,
        "role": role,
        "isApproved":isApproved
      };
}
Dschedule dscheduleFromMap(String str) => Dschedule.fromMap(json.decode(str));
String doschedule(User data) => json.encode(data.toMap());
class Dschedule {
  Dschedule(

      );
late int schedule_id;
  late int doctor_id;
  late String Date1;
  late String Time1;
  late String Date2;
  late String Time2;
  late String Date3;
  late String Time3;


  Dschedule.fromMap(Map<String, dynamic> json){
    schedule_id=json["schedule_id"];
    doctor_id=json["doctor_id"];
    Date1=json["Date1"];
    Time1=json["Time1"];
    Date2=json["Date2"];
    Time2=json["Time2"];
    Date3=json["Date3"];
    Time3=json["Time3"];

  }

  Map<String, dynamic> toMap() =>
      {
        "schedule_id":schedule_id,
        "doctor_id":doctor_id,
        "Date1":Date1,
        "Time1":Time1,
        "Date2":Date2,
        "Time2":Time2,
        "Date3":Date3,
        "Time3":Time3

      };
}

class User {
  User({
    required this.fullName,
    required this.emailAddress,
    required this.phoneNo,
    required this.gender,
    required this.password,

    required this.experience,
    required this.speacility,
    required this.role
    ,
  });

  String fullName;
  String emailAddress;
  String phoneNo;
  String gender;
  String password;
  late String image;
  String experience;
  String speacility;
  String role;

  factory User.fromMap(Map<String, dynamic> json) =>
      User(
        fullName: json["full_name"],
        emailAddress: json["email_address"],
        phoneNo: json["phone_no"],
        gender: json["gender"],
        password: json["password"],
        experience: json["experience"],
        speacility: json["speacility"],
        role: json["role"],

      );

  Map<String, dynamic> toMap() =>
      {
        "full_name": fullName,
        "email_address": emailAddress,
        "phone_no": phoneNo,
        "gender": gender,
        "password": password,
        "image": image,
        "experience": experience,
        "speacility": speacility,
        "role": role,

      };




}