import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dioFormData;
import 'package:get/get.dart';

import '../../../app/my_app_controller.dart';
import '../api_key.dart';
import 'loading.dart';
import 'log.dart';
import 'methods.dart';

class ApiRequest {
  final String? path;
  Map? body;
  Map<String, dynamic>? queryParameters;
  String? method;
  dynamic response;
  bool withLoading;

  final MyAppController _myAppController = Get.find<MyAppController>();

  ApiRequest(
      {required this.path,
      this.body,
      this.method,
      this.withLoading = false,
      this.queryParameters});

  Dio _dio() {
    // Put your authorization token here
    return Dio(
      BaseOptions(
        headers: {
          'Authorization': _myAppController.token != null
              ? 'Bearer ${_myAppController.token}'
              : 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjE1LCJpc3MiOiJodHRwOlwvXC86IiwiaWF0IjoxNTE3OTk0MjczLCJleHAiOjE1MjMxNzgyNzMsIm5iZiI6MTUxNzk5NDI3MywianRpIjoib1c5b2JaNEtRNXdMZTBJMCJ9.0x5zVrS22O8Kq3kRFljtBwO8g0oGfrW3GG_vEse8CQE',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'X-Client-Language': 'ar',
          'Connection': 'keep-alive',

          'X-Client-Device-UDID': _myAppController.deviceData['id'],
        },
      ),
    );
  }

  void request({
    Function()? beforeSend,
    Function(dynamic data, dynamic response)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    // start request time

    DateTime startTime = DateTime.now();

    try {
      // show  request detils in debug console
      showRequestDetails(
        method: method,
        path: path,
        body: body.toString(),
        queryParameters: queryParameters.toString(),
      );
      // strat spinnet loading
      if (withLoading) startLoading();
      // check method type
      switch (method) {
        case getMethod:
          response = await _dio().get(
            baseUrl + path!,
            queryParameters: queryParameters,
          );

          break;
        case postMethod:
          response = await _dio().post(
            baseUrl + path!,
            data: body,
            queryParameters: queryParameters,
          );
          break;
        case putMethod:
          response = await _dio().put(
            baseUrl + path!,
            data: body,
            queryParameters: queryParameters,
          );
          break;
        case deleteMethod:
          response = await _dio().delete(
            baseUrl + path!,
            data: body,
            queryParameters: queryParameters,
          );
          break;
      }
      // request time
      var time = DateTime.now().difference(startTime).inMilliseconds;
      // print response data in console
      printSuccessesResponse(response: response.data, time: time);
      if (withLoading) dismissLoading();
      if (onSuccess != null) {
        onSuccess(response.data['data'], response.data);
      }
    } catch (error) {
      // request time
      var time = DateTime.now().difference(startTime).inMilliseconds;

      if (error is DioError) {
        var errorResponse = error.response;
        // In case we get a null response for unknown reason
        var errorData = errorResponse != null
            ? errorResponse.data
            : {
                "errors": [
                  {"message": "Un handeled Error"}
                ]
              };
        //handle DioError here by error type or by error code
        // showMessage(
        //   withBackground: true,
        //   description:
        //       errorData["errors"] != null && errorData["errors"].length > 0
        //           ? errorData["errors"][0]["message"]
        //           : errorData["message"],
        //   textColor: ColorManager.error,
        // );
        // print response error
        printRequestError(error: errorData, time: time);

        if (onError != null) {
          onError(errorData);
        }
      } else {
        // handle another errors
        printErrorResponse(error);
      }
      if (withLoading) dismissLoading();
    }
  }
}

addFormDataToJson({fileKey = 'image', file, jsonObject}) async {
  jsonObject[fileKey] = await dioFormData.MultipartFile.fromFile(
    file.path,
    filename: file.path.split('/').last,
  );
  return dioFormData.FormData.fromMap(jsonObject);
}
