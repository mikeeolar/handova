import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static SharedPreferences? sharedPreferences;

  static const String userID = "USER_ID";
  static const String userEmail = "USER_EMAIL";
  static const String _userPassword = "USER_PASSWORD";
  static const String authToken = "TOKEN";
  static const String hasOnBoarded = "HAS_ON_BOARDED";
  static const String keyFingerPrintEnabled = "FINGER_PRINT";
  static const String stayLoggedIn = "STAY_LOGGED_IN";
  static const String userData = "USER_DETAILS";
  static const String _pageId = "PAGE_ID";
  static const String userLoggedIn = 'UsER_LOGGED_IN';
  static const String isCredentialVerified = 'CREDENTIALS_VERIFIED';

  static Future<void> initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setUserDetails({required String userDetails}) {
    SessionService.sharedPreferences!.setString(userData, userDetails);
  }

  static String getUserDetails({String? defaultData}) {
    String? value = SessionService.sharedPreferences!.getString(userData);
    if (value == null) {
      return defaultData!;
    }
    return value;
  }

  static void setAuthToken({required String token}) {
    SessionService.sharedPreferences!.setString(authToken, token);
  }

  static String getAuthToken({String? defaultToken}) {
    String? value = SessionService.sharedPreferences!.getString(authToken);
    if (value == null) {
      return defaultToken!;
    }
    return value;
  }

  static void setUserId({required int id}) {
    SessionService.sharedPreferences!.setInt(userID, id);
  }

  static int getUserId() {
    return SessionService.sharedPreferences!.getInt(userID)!;
  }

  static void setUserEmail({required String email}) {
    SessionService.sharedPreferences!.setString(userEmail, email);
  }

  static String getUserEmail() {
    return SessionService.sharedPreferences!.getString(userEmail)!;
  }

  static void setUserPassword({
    required String password,
  }) {
    SessionService.sharedPreferences!.setString(
      _userPassword,
      password,
    );
  }

  static String getUserPassword() {
    return SessionService.sharedPreferences!.getString(_userPassword)!;
  }

  static void setCurrentPage({required String pageId}) {
    SessionService.sharedPreferences!.setString(_pageId, pageId);
  }

  static String getCurrentPage() {
    return SessionService.sharedPreferences!.getString(_pageId)!;
  }

  static void setUserLoggedIn({required bool isLoggedIn}) {
    SessionService.sharedPreferences!.setBool(userLoggedIn, isLoggedIn);
  }

  static bool getUserLoggedIn({bool defaultValue = false}) {
    bool? value = SessionService.sharedPreferences!.getBool(userLoggedIn);
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  static bool? getEnableFingerPrint() {
    return SessionService.sharedPreferences!.getBool(keyFingerPrintEnabled) ??
        false;
  }

  static void setEnableFingerPrint({
    required bool value,
  }) {
    SessionService.sharedPreferences!.setBool(keyFingerPrintEnabled, value);
  }

  static void setBoolean(String key, bool value) {
    SessionService.sharedPreferences!.setBool(key, value);
  }

  static bool getBoolean(String key, bool defaultValue) {
    final value = SessionService.sharedPreferences!.getBool(key);
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  static void remove(String key) {
    if (SessionService.sharedPreferences!.containsKey(key)) {
      SessionService.sharedPreferences!.remove(key);
    }
  }
}
