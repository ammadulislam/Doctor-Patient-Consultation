import 'package:dp_consultation/providers/all_doctors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../usermodel.dart';
import 'doctorprofile.dart';
class approveddoctor extends StatefulWidget {
  @override
  State<approveddoctor> createState() => _approveddoctorState();
}

class _approveddoctorState extends State<approveddoctor> {
  String doctor = 'doctor';
  List<Aproveddoctors> data = [];
  Future<void> _refreshDoctors(BuildContext context) async {
    await Provider.of<All_doctor_provider>(context, listen: false)
        .find_doctorApproved(doctor.toString());
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade300,
          title: Text(
            'Approved Doctors ',
            style: TextStyle(
              fontFamily: 'fontMAIN',
            ),
          ),
        ),
        body: Consumer<All_doctor_provider>(
          builder: (context, provider, child) {
            if (provider.approved_list.isEmpty) {
              provider.find_doctorApproved(doctor.toString());
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () => _refreshDoctors(context),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final data = provider.approved_list[index];

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
                            data.fullName.substring(0, 1).toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        data.fullName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'fontMAIN',
                        ),
                      ),
                      subtitle: Text(data.experience),
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
                              builder: (context) => doctorprofile(data: data),
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
                  itemCount: provider.approved_list.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 20,
                      thickness: 2,
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
