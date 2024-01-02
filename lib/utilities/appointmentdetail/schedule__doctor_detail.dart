
class schedule_detail{
  late int app_id;
  late int doctor_id;
  late String date1;
  late String time1;
  late String date2;
  late String time2;
  late String date3;
  late String time3;
  schedule_detail.fromMap(Map<String,dynamic> map){
    app_id=map['schedule_id'];
    doctor_id=map['doctor_id'];
    date1=map['Date1'];
    time1=map['Time1'];
    date2=map['Date2'];
    time2=map['Time2'];
    date3=map['Date3'];
    time3=map['Time3'];
  }

  Object? toMap() {}


}
