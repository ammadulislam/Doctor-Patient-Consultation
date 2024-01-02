import 'package:dio/dio.dart';


setappointmentofpatient(doctorid,patientid,date,time) async{
  var dio=Dio();
  var url="http://192.168.1.12/TelApp/api/users/setAppointment";
  var response=await dio.post(url,data:{
    "doctor_id":doctorid,
    "patient_id":patientid,
    "Date":date,
    "Time":time
  });

  var res=response.data;
  return res;
}
Future<dynamic> getDataByPatientId(patientId) async {
  var dio = Dio();
  var url = "http://192.168.1.12/TelApp/api/users/GetDataByPatientId";
  var response = await dio.get(url, queryParameters: {
    "patient_id": patientId,
  });

  var data = response.data;
  return data;
}
