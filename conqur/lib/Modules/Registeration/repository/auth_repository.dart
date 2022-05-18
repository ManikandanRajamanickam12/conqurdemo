import 'package:conqur/Modules/Registeration/model/body_metrics_request.dart';
import 'package:conqur/Modules/Registeration/model/login_request.dart';
import 'package:conqur/Modules/Registeration/model/login_response.dart';
import 'package:conqur/Modules/Registeration/model/terms_agreed_request.dart';
import 'package:conqur/Modules/Registeration/model/user_details_request.dart';
import 'package:conqur/Modules/Registeration/model/verify_otp_request.dart';
import 'package:conqur/Modules/Registeration/model/verify_otp_response.dart';
import 'package:conqur/helpers/Network/CustomException.dart';
import 'package:conqur/helpers/Network/EndPoint.dart';
import 'package:conqur/helpers/Network/NetworkManager.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  NetworkManager manager = NetworkManager();

  Future<LoginResponse> signUpReq(LoginRequest requestModel) async {
    Response? response;
    try {
      response = await manager.postData(
          endPoint: EndPoint.login, data: requestModel.toJson());
      if (response.statusCode == 200) {
        var jsonData = response.data;
        return LoginResponse.fromJson(jsonData);
      } else {
        throw THttpException.from(response.data, response.statusCode!);
      }
    } on Exception catch (e) {
      throw THttpException.fromException(e);
    }
  }

  Future<VerifyOtpResponse> verifyOtpReq(VerifyOtpRequest requestModel) async {
    Response? response;
    try {
      response = await manager.postData(
          endPoint: EndPoint.verifyOtp, data: requestModel.toJson());
      if (response.statusCode == 200) {
        var jsonData = response.data;
        return VerifyOtpResponse.fromJson(jsonData);
      } else {
        throw THttpException.from(response.data, response.statusCode!);
      }
    } on Exception catch (e) {
      throw THttpException.fromException(e);
    }
  }

  Future<LoginResponse> resendOtpReq(String authToken) async {
    Response? response;
    try {
      response = await manager.postData(
          endPoint: EndPoint.resendOtp, data: {"auth_token": authToken});
      if (response.statusCode == 200) {
        var jsonData = response.data;
        return LoginResponse.fromJson(jsonData);
      } else {
        throw THttpException.from(response.data, response.statusCode!);
      }
    } on Exception catch (e) {
      throw THttpException.fromException(e);
    }
  }

  Future<LoginResponse> termsAgreedReq(TermsAgreedRequest requestModel) async {
    Response? response;
    try {
      response = await manager.updateData(
          endPoint: EndPoint.termsAgreed, data: requestModel.toJson());
      if (response.statusCode == 200) {
        var jsonData = response.data;
        print("===========OUTPUT PARAMETERS==========\n${jsonData.toString()}");
        return LoginResponse.fromJson(jsonData);
      } else {
        throw THttpException.from(response.data, response.statusCode!);
      }
    } on Exception catch (e) {
      throw THttpException.fromException(e);
    }
  }

  Future<LoginResponse> userDetailsReq(UserDetailsRequest requestModel) async {
    Response? response;
    try {
      response = await manager.updateData(
          endPoint: EndPoint.userDetails, data: requestModel.toJson());
      if (response.statusCode == 200) {
        var jsonData = response.data;
        print("===========OUTPUT PARAMETERS==========\n${jsonData.toString()}");
        return LoginResponse.fromJson(jsonData);
      } else {
        throw THttpException.from(response.data, response.statusCode!);
      }
    } on Exception catch (e) {
      throw THttpException.fromException(e);
    }
  }

  Future<LoginResponse> bodyMetricsReq(BodyMetricsRequest requestModel) async {
    Response? response;
    try {
      response = await manager.updateData(
          endPoint: EndPoint.bodyMetrics, data: requestModel.toJson());
      if (response.statusCode == 200) {
        var jsonData = response.data;
        print("===========OUTPUT PARAMETERS==========\n${jsonData.toString()}");
        return LoginResponse.fromJson(jsonData);
      } else {
        throw THttpException.from(response.data, response.statusCode!);
      }
    } on Exception catch (e) {
      throw THttpException.fromException(e);
    }
  }
}
