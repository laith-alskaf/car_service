import '../network_config.dart';

class AdminEndpoint {

  static String getHistoryProblem = NetworkConfig.getFullApiRout('Admin/getAll-repairOrder');
  static String updateOrderProblem = NetworkConfig.getFullApiRout('Admin/update-repairOrder');
  static String deleteOrderProblem = NetworkConfig.getFullApiRout('Admin/delete-repairOrder');
  static String addPark = NetworkConfig.getFullApiRout('Admins/addPark');
}