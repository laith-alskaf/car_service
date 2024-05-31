import 'package:car_service/core/enums/request_type.dart';
import 'package:car_service/core/utils/general_util.dart';

class NetworkConfig {
  static String BASE_API = 'api/';

  static String getFullApiRout(String apirout) {
    return BASE_API + apirout;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      required RequestType type,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth!) "Authorization": "Bearer ${storage.getTokenInfo}",
      // if (type != RequestType.GET)
      "Content-Type": "application/json",
      ...extraHeaders ?? {}
    };
  }
}
