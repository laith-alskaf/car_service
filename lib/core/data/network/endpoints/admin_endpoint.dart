import '../network_config.dart';

class AdminEndpoint {

  static String getHistoryProblem = NetworkConfig.getFullApiRout('Admin/getAll-repairOrder');
  static String updateOrderProblem = NetworkConfig.getFullApiRout('Admin/update-repairOrder');
}