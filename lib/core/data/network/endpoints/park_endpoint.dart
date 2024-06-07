import 'package:car_service/core/data/network/network_config.dart';

class ParkEndPoints {
  static String getClosestPark = NetworkConfig.getFullApiRout('parking/getclosestpark');
  static String choosePark = NetworkConfig.getFullApiRout('parking/getParkingSpots');
  static String chooseTime = NetworkConfig.getFullApiRout('parking/bookingPark');
}
