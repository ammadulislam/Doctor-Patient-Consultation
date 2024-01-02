

import 'dart:convert';
import 'package:dp_consultation/utilities/appointmentdetail/schedule__doctor_detail.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';


import '../../providers/global_data.dart';



class ScheduleProvider with ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<schedule_detail> _schDet=[];
  List<schedule_detail> get schDet => _schDet;
  Future<void> find_doctor(int doc_id) async {
    if (_schDet.isNotEmpty && _schDet[0].doctor_id == doc_id) {
      // The schedule details for the given doctor are already fetched
      return;
    }

    _isLoading = true;
    final response = await http.get(Uri.parse('http://192.168.1.12/TelApp/api/users/getdoctorschedule?id=$doc_id'));
    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData is List) {
        _schDet = responseData.map((schDet) => schedule_detail.fromMap(schDet)).toList();
        notifyListeners();
      } else if (responseData is Map<String, dynamic>) {
        _schDet = [schedule_detail.fromMap(responseData)];
        _isLoading = false;
        notifyListeners();
      }
    } else {
      throw Exception('Failed to load product');
    }
  }
}