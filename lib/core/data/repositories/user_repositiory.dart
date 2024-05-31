import 'dart:developer';
import 'package:car_service/core/utils/general_util.dart';
import 'package:dartz/dartz.dart';
import 'package:car_service/core/data/models/common_respons.dart';
import 'package:car_service/core/data/network/endpoints/user_endpoints.dart';
import 'package:car_service/core/data/network/network_config.dart';
import 'package:car_service/core/enums/request_type.dart';
import 'package:car_service/core/utils/network_utils.dart';

class UserRepository {
  Future<Either<String, String>> login({
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
            'email': email,
            'password': password,
          }).then((response) {
        log('==========> ${response}');
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          storage.setTokenInfo(commonResponse.data!['token']);
          return Right(commonResponse.data!['message']);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> verifyResetPassword({
    required String code,
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.verifyResetPassword,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'code': code,
            'email': email,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(commonResponse.data!['message']);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }  Future<Either<String, String>>
  resetPassword({
    required String newPassword,
    required String confirmPassword,
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.resetPassword,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'newPassword': newPassword,
            'confirmPassword': confirmPassword,
            'email': email,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(commonResponse.data!['message']);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> forgetPassword({
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
          return Right(commonResponse.data!['message']);
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
        log('==========> ${response}');
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          storage.setTokenInfo(commonResponse.data!['token']);
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> register({
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
          return Right(commonResponse.data!['message']);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
