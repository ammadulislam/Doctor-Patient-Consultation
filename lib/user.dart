import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'DoctorSignUpPage.dart';
import '../providers/global_data.dart';
class User
{
  late String email,password,role;
  String? img;
  late int id;
  User();
  User.fromMap(Map<String,dynamic> map)
  {
    email=map["email"];
    password=map["password"];
    role=map["role"];
    img=map["image"];
    id=map["sid"];
  }
  Map<String,dynamic> tomap()
  {
    return <String,dynamic>{
      'email':email,
      'password':password,
      'role':role,
      'sid':id,
    };
  }
  Future<String?> login() async
  {
    //String url='${ip}/user/Login?email=${email}&password=${password}';
    String url='http://localhost/TelApp/user/Login?email=${email}&password=${password}';
    print(url);
    Uri uri=Uri.parse(url);
    var response=await http.get(uri);
    //  print('response code ${response.statusCode}');
    if(response.statusCode==200) {
      print('Body ${response.body}');
      return response.body;
    }
    return null;

  }

  //Create Account


  Future<String?> signupObject()async{
    String url='http://localhost/TelApp/user/Signup';
    Uri uri=Uri.parse(url);
    var reseponse =await http.post(uri,
        body:jsonEncode(tomap()),
        headers: <String,String>{
          'Content-Type': 'application/json'
        }
    );
    if(reseponse.statusCode==200)
      return reseponse.body;
    print('Data inserted');
    return null;
  }
  Future<String?> uploadPic(File f)async
  {
    String url='$ip/UpdateProfileImage';
    Uri uri=Uri.parse(url);
    var request= http.MultipartRequest('POST',uri);
    request.fields["id"]=id.toString();
    http.MultipartFile newfile=await http.MultipartFile.fromPath('photo',f.path);
    request.files.add(newfile);
    var response=await request.send();
    if(response.statusCode==200)
      return 'Uploaded';

    return null;

  }

}