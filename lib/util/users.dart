import 'package:shared_preferences/shared_preferences.dart';

Future<bool> usernameExists() {
  return SharedPreferences.getInstance()
      .then<bool>((preferences) => (preferences.getString("username") != null));
}
