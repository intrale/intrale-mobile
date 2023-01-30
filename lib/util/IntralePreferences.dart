import 'package:intrale/util/IntraleTokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String EMAIL = 'email';
const String ACCESS_TOKEN = 'accessToken';
const String ID_TOKEN = 'idToken';
const String FCM_TOKEN = 'fcmToken';

class IntralePreferences {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  static final IntralePreferences _singleton = IntralePreferences._();

  IntralePreferences._();

  factory IntralePreferences() {
    return _singleton;
  }

  Future<String?> readEmail(){
     return sharedPreferences.then((preferences) => preferences.getString(EMAIL));
  }

  Future<IntraleTokens> read(){
     return sharedPreferences.then((preferences) => 
       IntraleTokens(
        idToken: preferences.getString(ID_TOKEN), 
        accessToken: preferences.getString(ACCESS_TOKEN),
        fcmToken: preferences.getString(FCM_TOKEN))
     );
  }

  void write(String email, String idToken, String accesToken){
    sharedPreferences.then((preferences) => {
      preferences.setString(EMAIL, email),
      preferences.setString(ID_TOKEN, idToken),
      preferences.setString(ACCESS_TOKEN, accesToken)
    });
  }

  void writeFCMToken(String fcmToken){
    sharedPreferences.then((preferences) => {
      preferences.setString(FCM_TOKEN, fcmToken),
    });
  }



  void reset(){
    sharedPreferences.then((preference) => {
      preference.remove(ACCESS_TOKEN),
      preference.remove(ID_TOKEN),
      preference.remove(FCM_TOKEN),
      preference.remove(EMAIL)
    });
  }
}