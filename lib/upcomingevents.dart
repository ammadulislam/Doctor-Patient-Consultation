import 'dart:convert';
import 'package:dp_consultation/patientprofile.dart';
import 'package:dp_consultation/utilities/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class upcomingevent extends StatefulWidget {
  final int id;
  final String name;

  upcomingevent(this.name, this.id);

  @override
  State<upcomingevent> createState() => _upcomingeventState();
}

class _upcomingeventState extends State<upcomingevent> {
  List<Appointment> arrNames = [];
  var appointment;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var url = 'http://192.168.0.114/Hospital_System_API/api/Hospital/GetDataByPatientId?patient_id=${widget.id.toString()}';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<Appointment> appointments = [];

        for (var item in jsonData) {
          var appointment = Appointment.fromJson(item);
          appointments.add(appointment);
        }

        setState(() {
          arrNames = appointments;
        });
      } else {
        print('API request failed with status code: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 755,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/signupbackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.purple.shade300,
            title: Text(
              'Upcoming Event ',
              style: TextStyle(fontFamily: 'fontMAIN'),
            ),
          ),
          body: ListView.separated(
            itemBuilder: (context, index) {
               appointment = arrNames[index];

              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      appointment.fullName[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  appointment.fullName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'fontMAIN',
                  ),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(""), //date
                        Container(width: 5),
                        Text(appointment.time),
                      ],
                    ),
                    // Add additional appointment details if needed
                  ],
                ),
                trailing: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(5, 20),
                    side: BorderSide(
                      color: Colors.purple.shade100,
                      width: 2,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => patientprofile(this.appointment),
                      ),
                    );
                  },
                  child: Text(
                    "View Profile",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'fontMAIN',
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
            itemCount: arrNames.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 30,
                thickness: 2,
              );
            },
          ),
        ),
      ),
    );
  }
}
