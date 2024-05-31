import 'dart:developer';
import 'package:car_service/core/data/models/api/choos_parking_model.dart';
import 'package:car_service/core/data/network/endpoints/park_endpoint.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:dartz/dartz.dart';
import 'package:car_service/core/data/models/common_respons.dart';
import 'package:car_service/core/data/network/network_config.dart';
import 'package:car_service/core/enums/request_type.dart';
import 'package:car_service/core/utils/network_utils.dart';

class ParkRepository {
  Future<Either<String, List<ChooseParkingModel>>> getClosestPark({
    required String lat,
    required String long,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.getClosestPark,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
          body: {
            'userLatitude': lat,
            'userLongitude': long,
          }).then((response) {
        log('==========> ${response}');
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        List<ChooseParkingModel> listParking = [];
        for (Map<String,dynamic> parkingModel in commonResponse.data!['parkingLocations']) {
          listParking.add(ChooseParkingModel.fromJson(parkingModel));
        }
        if (commonResponse.getStatus) {
          return Right(listParking);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String,String>> choosePark({
    required String parkNumber,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.choosePark,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
          body: {
            'parkNumber': parkNumber,
          }).then((response) {
        log('==========> ${response}');
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return const  Right('Done Choose Parking');
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
