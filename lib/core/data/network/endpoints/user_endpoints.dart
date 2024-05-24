import 'package:car_service/core/data/network/network_config.dart';

class UserEndPoints {
  static String login = NetworkConfig.getFullApiRout('user/login');
  static String resetPassword = NetworkConfig.getFullApiRout('user/resetPassword');
  static String forgetPassword = NetworkConfig.getFullApiRout('user/forgetPassword');
  static String register = NetworkConfig.getFullApiRout('user/register');
  static String verifyCode = NetworkConfig.getFullApiRout('user/sendCode');
  static String sendCode = NetworkConfig.getFullApiRout('user/verifyCode');
}
