import 'dart:developer';
import 'package:car_service/core/data/network/endpoints/admin_endpoint.dart';
import 'package:dartz/dartz.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/api/problem_model.dart';
import '../models/common_respons.dart';
import '../network/network_config.dart';

class AdminRepositories {
  Future<Either<String, List<ProblemHistoryModel>>> getHistoryProblem() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.getHistoryProblem,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {}).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<ProblemHistoryModel> historyProblem = [];
            for (Map<String, dynamic> s in commonResponse.data!) {
              historyProblem.add(ProblemHistoryModel.fromJson(s));
            }
            print(historyProblem.length);
            return Right(historyProblem);
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

  Future<Either<String, String>> updateOrderProblem({
    required String orderId,
    required int price,
    required String date,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.updateOrderProblem,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'orderId': orderId,
            'price': price,
            'date': date,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['message']);
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
