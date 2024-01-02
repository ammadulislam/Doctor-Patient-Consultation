
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

import '../User.dart';
import '../usermodel.dart';

import 'global_data.dart';

class All_doctor_provider with ChangeNotifier {
  List<Userspec> _doctors = [];

  List<Userspec> get doc_list => _doctors;

  Future<void> find_doctor(String doc) async {
    final response = await http.get(
        Uri.parse('${ip}/users/get_all?doctors=$doc'));
    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData is List) {
        _doctors =
            responseData.map((doc_list) => Userspec.fromMap(doc_list)).toList();
        notifyListeners();
      } else if (responseData is Map<String, dynamic>) {
        _doctors = [Userspec.fromMap(responseData)];
        notifyListeners();
      }
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  List<Aproveddoctors> _appdoctors = [];

  List<Aproveddoctors> get approved_list => _appdoctors;

  Future<void> find_doctorApproved(String doc) async {
    final response = await http.get(
        Uri.parse('${ip}/users/getapproved_doctors?doctors=$doc'));
    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData is List) {
        _appdoctors =
            responseData.map((approved_list) =>
                Aproveddoctors.fromMap(approved_list)).toList();
        notifyListeners();
      } else if (responseData is Map<String, dynamic>) {
        _appdoctors = [Aproveddoctors.fromMap(responseData)];
        notifyListeners();
      }
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  List<Dschedule> _schedule = [];

  List<Dschedule> get schedule_list => _schedule;

  Future<void> doctor_schedule(int id) async {
    print(id);
    final response = await http.get(
        Uri.parse('${ip}/users/getdoctorschedule?id=$id'));
    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData is List) {
        print("Listing");
        _schedule =
            responseData.map((schedule_list) =>
                Dschedule.fromMap(schedule_list)).toList();
        notifyListeners();
      } else if (responseData is Map<String, dynamic>) {
        print("Mapping");
        _schedule = [Dschedule.fromMap(responseData)];


        notifyListeners();
      }
    } else {
      throw Exception('Failed to load schedule');
    }
  }





}

