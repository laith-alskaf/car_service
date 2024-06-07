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
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          List<ChooseParkingModel> listParking = [];
          for (Map<String, dynamic> parkingModel
              in commonResponse.data!['parkingLocations']) {
            listParking.add(ChooseParkingModel.fromJson(parkingModel));
          }
          if (commonResponse.getStatus) {
            return Right(listParking);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return const Left('Please check your internet');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>> choosePark({
    required String ParkingNumber,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.choosePark,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
          body: {
            'ParkingNumber': ParkingNumber,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(commonResponse.data);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return const Left('Please check your internet');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>> chooseTimeSpot({
    required int duration,
    required String date,
    required int Spot,
    required String parkingName,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.chooseTime,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
          body: {
            // 'username': storage.getUserInfo()!.username!,
            'username':'hashem112',
            'duration': duration,
            'date': date,
            'parkingName': parkingName,
            'Spot': Spot,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return const Left('Please check your internet');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
