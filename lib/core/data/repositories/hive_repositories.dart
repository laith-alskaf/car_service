import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

class HiveRepository {
  static String HIVE_FIRST_LOGIN = "first_login";
  static String HIVE_LOGIN_MODEL = 'login_model';
  static String HIVE_TOKEN_INFO = 'token_info';
  static String HIVE_GENERAL_BOX = "app_general_info";
  late Box primaryBox;

  Future<void> init() async {
    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    primaryBox = await Hive.openBox(HIVE_GENERAL_BOX);
  }

  Future<void> clearHive() async {
    if (primaryBox.isNotEmpty) {
      await primaryBox.clear();
    }
  }

  Future<void> openHive() async {
    primaryBox = await Hive.openBox(HIVE_GENERAL_BOX);
  }

  Future<void> setTokenInfo(String value) async {
    Hive.box(HIVE_GENERAL_BOX).put(HIVE_TOKEN_INFO, value);
  }

  String get getTokenInfo =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_TOKEN_INFO, defaultValue: '');
}
