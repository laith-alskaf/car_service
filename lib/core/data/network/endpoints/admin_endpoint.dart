import '../network_config.dart';

class adminendpoint {

  static String getHistoryProblem = NetworkConfig.getFullApiRout('Admin/getAll-repairOrder');
  static String updateOrder = NetworkConfig.getFullApiRout('Admin/update-repairOrder');
}