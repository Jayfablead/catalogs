import 'package:shared_preferences/shared_preferences.dart';

void createUserSHP(
  String username,
  String password,
) async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  _sharedpreferences.setString('username', username);
  _sharedpreferences.setString('password', password);
}

Future<String?> getusername() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  return _sharedpreferences.getString('username');
}

Future<String?> getuserpwd() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  return _sharedpreferences.getString('password');
}

Future<String?> setusedid(String uid) async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  _sharedpreferences.setString('dId', uid);
}

Future<String?> getuid() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  return _sharedpreferences.getString('dId');
}

void islogin(bool value) async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  _sharedpreferences.setBool('loginstatus', value);
}

Future<bool?> getisloginSHP() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  return _sharedpreferences.getBool('loginstatus');
}

void cleanSHP() async {
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  _sharedpreferences.clear();
}
