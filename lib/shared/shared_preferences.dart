
import 'package:dressmeup/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum PrefKey{
  loggedIn , name , email , passwored , id , loggedInAdmin
}


class SharedPref{
  late SharedPreferences _sharedPreferences;
  SharedPref._internal();
  static final SharedPref _instance = SharedPref._internal();

  factory SharedPref(){
    return _instance;
  }
  Future<void> initPreferences() async{
    _sharedPreferences=await SharedPreferences.getInstance();
  }


  Future<void>saveDataSignUp({required User user})async{
    await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKey.email.toString(), user.email);
    await _sharedPreferences.setString(PrefKey.name.toString(), user.name);
    await _sharedPreferences.setString(PrefKey.passwored.toString(), user.passwored);
  }

  Future<void>saveDataLogIn({required User user})async{
    await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKey.email.toString(), user.email);
    await _sharedPreferences.setString(PrefKey.passwored.toString(), user.passwored);
  }


  Future<void>saveDataAdmin({required User user})async{
    await _sharedPreferences.setBool(PrefKey.loggedInAdmin.toString(), true);
    await _sharedPreferences.setString(PrefKey.email.toString(), user.email);
    await _sharedPreferences.setString(PrefKey.passwored.toString(), user.passwored);
  }




  bool get loggedIn => _sharedPreferences.getBool(PrefKey.loggedIn.toString()) ?? false ;
  bool get loggedInAdmin => _sharedPreferences.getBool(PrefKey.loggedInAdmin.toString()) ?? false ;

  T? getValue<T>(String key){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> clear() async{
    return await _sharedPreferences.clear();
  }


}