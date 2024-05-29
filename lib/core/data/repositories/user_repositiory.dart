import 'package:dartz/dartz.dart';
import 'package:car_service/core/data/models/api/token_info.dart';
import 'package:car_service/core/data/models/common_respons.dart';
import 'package:car_service/core/data/network/endpoints/user_endpoints.dart';
import 'package:car_service/core/data/network/network_config.dart';
import 'package:car_service/core/enums/request_type.dart';
import 'package:car_service/core/utils/network_utils.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.login,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'userName': email,
            'password': password,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(
            commonResponse.data ?? {},
          ));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> resetPassword({
    required String code,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.resetPassword,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'code': code,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> forgetPassword({
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.forgetPassword,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'email': email,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> verify({
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndPoints.verifyCode,
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
        body: {
          'email': email,
        },
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> sendCode({
    required String code,
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.sendCode,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {'code': code, 'email': email}).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          // print(commonResponse.data!);
          // storage.setTokenInfo(commonResponse.data!['token']);

          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String lastName,
    required String firstName,
    required String carNumber,
    required String carModel,
    required String carType,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndPoints.register,
        body: {
          'email': email,
          'username': firstName,
          'password': password,
          'confirmPassword': password,
          'lastName': lastName,
          'firstName': firstName,
          'carNumber': carNumber,
          'carModel': carModel,
          'carType': carType,
        },
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return const Right(true);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
