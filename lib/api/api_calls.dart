import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

callPostRequest(
    {required String routeID,
    required String api,
    required Map<dynamic, dynamic> payload,
    required Map<String, String> header}) async {
  bool isSuccess = false;

  try {
    late http.Response response;

    await http
        .post(Uri.parse(api), body: jsonEncode(payload), headers: header)
        .timeout(const Duration(seconds: 15))
        .catchError((err) {}, test: (error) => error is int && error >= 400)
        .then((resp) {
      response = resp;

      if (kDebugMode) {
        print(response.contentLength == null
            ? response
            : "StatusCode- ${response.statusCode}. ${response.body}");
      }

      if (response.statusCode != 200) {
        // httpErrorResponses(response);
      } else {
        isSuccess = true;
      }
    });

    return isSuccess == true ? response : "Exception";
  } on SocketException catch (error) {
    // socketException(routeID, error);
    return "SocketException";
  } on TimeoutException catch (error) {
    //  timeoutException(routeID, error);
    return "TimeoutException";
  } on Exception catch (error) {
    //  unhandledException(routeID, error);
    return "Exception";
  }
}

callPutRequest(
    {required String routeID,
    required String api,
    required Map<dynamic, dynamic> payload,
    required Map<String, String> header}) async {
  bool isSuccess = false;

  try {
    late http.Response response;

    await http
        .put(Uri.parse(api), body: jsonEncode(payload), headers: header)
        .timeout(const Duration(seconds: 15))
        .catchError((err) {}, test: (error) => error is int && error >= 400)
        .then((resp) {
      response = resp;

      if (kDebugMode) {
        print(response.contentLength == null
            ? response
            : "StatusCode- ${response.statusCode}. ${response.body}");
      }

      if (response.statusCode != 200) {
        //    httpErrorResponses(response);
      } else {
        isSuccess = true;
      }
    });

    return isSuccess == true ? response : "Exception";
  } on SocketException catch (error) {
    // socketException(routeID, error);
    return "SocketException";
  } on TimeoutException catch (error) {
    //  timeoutException(routeID, error);
    return "TimeoutException";
  } on Exception catch (error) {
    return "Exception";
  }
}

callGetRequestWithParameters(
    {required String routeID,
    required String host,
    required String api,
    required Map<String, String> payload,
    required Map<String, String> header}) async {
  bool isSuccess = false;
  try {
    var uri = Uri(
      scheme: 'https',
      host: host,
      path: api,
      queryParameters: payload,
    );

    late http.Response response;

    await http
        .get(uri, headers: header)
        .timeout(const Duration(seconds: 15))
        .catchError((err) {}, test: (error) => error is int && error >= 400)
        .then((resp) {
      response = resp;

      if (kDebugMode) {
        print(response.contentLength == null ? response : response.body);
      }

      if (response.statusCode != 200) {
        //  httpErrorResponses(response);
      } else {
        isSuccess = true;
      }
    });

    return isSuccess == true ? response : "Exception";
  } on SocketException catch (error) {
    //  socketException(routeID, error);
    return "SocketException";
  } on TimeoutException catch (error) {
    //  timeoutException(routeID, error);
    return "TimeoutException";
  } on Exception catch (error) {
    return "Exception";
  }
}

callGetRequestWithoutParameters(
    {required String routeID,
    required String api,
    required Map<String, String> header}) async {
  bool isSuccess = false;

  try {
    late http.Response response;

    await http
        .get(Uri.parse(api), headers: header)
        .timeout(const Duration(seconds: 10), onTimeout: () {
          return http.Response(
              jsonEncode({'errorMessage': "Timeout connecting"}), 408);
        })
        .catchError((err) {}, test: (error) => error is int && error >= 400)
        .then((resp) {
          response = resp;

          // if (kDebugMode) {
          //   print(response.contentLength == null ? response : response.body);
          // }

          // if (jsonDecode(response.body).length() > 1) {
          if (response.statusCode != 200) {
            if (routeID != "/TopUpCheckBalance" && response.statusCode != 404) {
              //   httpErrorResponses(response);
            }
          } else {
            isSuccess = true;
          }
        });

    return isSuccess == true ? response : "Exception";
  } on SocketException catch (error) {
    // socketException(routeID, error);
    return "SocketException";
  } on TimeoutException catch (error) {
    // timeoutException(routeID, error);
    return "TimeoutException";
  } on Exception catch (error) {
    return "Exception";
  }
}
