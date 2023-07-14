import 'package:shared_preferences/shared_preferences.dart';

getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString("token")!;
  return data;
}

getId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString("id")!;
  return data;
}

getTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString("time")!;
  return data;
}
