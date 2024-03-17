import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

class HiveRepository {
  static String HIVE_FIRST_RUN = "first_launch";
  static String HIVE_FIRST_LOGIN = "first_login";
  static String HIVE_LOGIN_MODEL = 'login_model';
  static String HIVE_TOKEN_INFO = 'token_info';
  static String HIVE_READING_EMAILS = 'reading_Emails';
  static String HIVE_USER_INFO = 'user_info';
  static String HIVE_GENERAL_BOX = "app_general_info";
  static String HIVE_EMAILS_BOX = "app_general_info";
  late Box primaryBox;
  late Box emailsBox;

  Future<void> init() async {

    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    primaryBox = await Hive.openBox(HIVE_GENERAL_BOX);
    emailsBox = await Hive.openBox(HIVE_EMAILS_BOX);
  }

  Future<void> clearHive() async {
    if (primaryBox.isNotEmpty) {
      await primaryBox.clear();
    }
  }

  Future<void> openHive() async {
    primaryBox = await Hive.openBox(HIVE_GENERAL_BOX);
  }

  //Store First application launch
  Future<void> setFirstLaunch(bool value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(HIVE_FIRST_RUN, value);
  }

  Future<void> setReadEmail(List<int> value) async {
    await Hive.box(HIVE_EMAILS_BOX).put(HIVE_READING_EMAILS, value);
  }

  List<int>? get getReadingEmails {
    if (Hive.box(HIVE_EMAILS_BOX).containsKey(HIVE_READING_EMAILS)) {
      return Hive.box(HIVE_EMAILS_BOX)
          .get(HIVE_READING_EMAILS, defaultValue: {});
    } else {
      return null;
    }
  }

  bool get getFirstLaunch =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_FIRST_RUN, defaultValue: false);

  // Store First login to prevent multi login after closing app
  Future<void> setFirstLogin(bool value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(HIVE_FIRST_LOGIN, value);
  }

  bool get getFirstLogin =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_FIRST_LOGIN, defaultValue: false);



  //Store token and get it
  Future<void> setTokenInfo(String value) async {
    Hive.box(HIVE_GENERAL_BOX).put(HIVE_TOKEN_INFO, value);
  }

  String get getTokenInfo =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_TOKEN_INFO, defaultValue: '');
}
