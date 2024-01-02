import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

import '../User.dart';
import '../usermodel.dart';
import '../providers/global_data.dart';

class speciality with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Userspec> _special = [];
  List<Userspec> get spec_list => _special;

  Future<void> find_doctor(String spec) async {
    _isLoading = true;
    try {
      final response = await http.get(Uri.parse('http://192.168.0.114/Hospital_System_API/api/Hospital/getdoctor?speciality=$spec'));

      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body);
        if (responseData is List) {
          _special = responseData.map((spec_list) => Userspec.fromMap(spec_list)).toList();
          notifyListeners();
        } else if (responseData is Map<String, dynamic>) {
          _special = [Userspec.fromMap(responseData)];
          notifyListeners();
        }
        _isLoading = false;
      } else {
        throw Exception('Failed to load doctors: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      throw Exception('Failed to load doctors: $error');
    }
  }
}
