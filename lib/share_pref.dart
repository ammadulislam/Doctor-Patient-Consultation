

// import 'package:shared_preferences/shared_preferences.dart';
//
// class share_pref_checkLogin{
//   Future<bool> isLoggedIn() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     return isLoggedIn;
//   }
//   Future<String> getUserRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userRole = prefs.getString('userRole') ?? 'user';
//     return userRole;
//   }
// }