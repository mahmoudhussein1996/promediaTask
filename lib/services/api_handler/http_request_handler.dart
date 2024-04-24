import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promedia_task/main.dart';
import 'package:promedia_task/services/api_handler/http_request_exception.dart';
import 'package:promedia_task/services/api_handler/urls.dart';
import 'package:promedia_task/utilties/toast_helper.dart';



enum RequestType {post,get,put,delete,}

class HttpHelper {

  static Future postRequest({
    required String url,
    required Map<String, String> body,
    String? token,
    List<http.MultipartFile> files = const [],
    Map<String, String>? headers,
  }) async {
    debugPrint(body.toString());
    debugPrint("${ProMediaEndPoints.baseServerURL}$url");
    var request = MultipartRequest(
      'POST',
      Uri.parse("${ProMediaEndPoints.baseServerURL}$url"),
      onProgress: (int bytes, int total) async {
        final progress = bytes / total;
        log(">>>>>>>>> progress: $progress");
      },
    );
    request.fields.addAll(body);
    for (int i = 0; i < files.length; i++) {
      request.files.add(files[i]);
    }

    request.headers.addAll({
      'Accept': 'application/json',
    });
    if (token != null) {
      request.headers.addAll(
          {'Authorization': 'Bearer $token'});
    }
    if (headers != null) {
      request.headers.addAll(headers);
    }
    try
    {
      http.StreamedResponse response = await request.send().timeout(const Duration(minutes: 1),
          onTimeout: () async => await ToastHelper.showError(message: " The API call timed out. "));
      String result = await response.stream.bytesToString();
      log(response.statusCode.toString());
      // if (response.statusCode == 401) {
      //   Modular.to.pushReplacementNamed(LoginScreen.routeName, arguments: false);
      //   return;
      // }
      // else
      if (response.statusCode == 500) {
        ToastHelper.showError(message: "something wrong");
        return;
      }
      // else if (response.statusCode == 422){
      //   Modular.to.pushReplacementNamed(ThirdOnBoardingScreen.routeName);
      //   return;
      // }
      log(result.toString());
      return json.decode(result);
    }on SocketException catch (socketException) {
      ToastHelper.showError(message: "there is no internet");
    }on HttpException catch(httpException)
    {
      ToastHelper.showError(message: httpException.message.toString());
    }on FormatException catch(formException)
    {
      ToastHelper.showError(message: formException.message.toString());
    }on TimeoutException catch(timeOutException)
    {
      ToastHelper.showError(message: timeOutException.message.toString());
    }on HandshakeException catch(handShakeException)
    {
      ToastHelper.showError(message: handShakeException.message.toString());
    }
    catch (error) {
      ToastHelper.showError(message: error.toString());
      return null;
    }

  }

  static Future getRequest({
    required String url,
    Map<String, String>? headers,
    String? token
  }) async {
    debugPrint("${ProMediaEndPoints.baseServerURL}$url");

    var request = http.Request('GET', Uri.parse("${ProMediaEndPoints.baseServerURL}$url"));
    request.headers.addAll({
      'Accept': 'application/json',
    });
    if (token != null) {
      request.headers.addAll({
        'Authorization': 'Bearer $token'
      });
    }
    if (headers != null) {
      request.headers.addAll(headers);
    }
    debugPrint(request.headers.toString());

    try
    {
      http.StreamedResponse response = await request.send().timeout(const Duration(seconds: 30),
          onTimeout: () async => await ToastHelper.showError(message: " The API call timed out. "));

      String result = await response.stream.bytesToString();
      log(response.statusCode.toString());
      // if (response.statusCode == 401) {
      //   Modular.to.pushReplacementNamed(LoginScreen.routeName, arguments: false);
      //   return;
      // } else
      if (response.statusCode == 500) {
        ToastHelper.showError(message: "something wrong");
        return;
      }
      // else if (response.statusCode == 422){
      //   Modular.to.pushReplacementNamed(ThirdOnBoardingScreen.routeName);
      //   return;
      // }
      log(result.toString());
      return json.decode(result);
    }on SocketException catch (socketException) {
      ToastHelper.showError(message: "there is no internet");
    }on HttpException catch(httpException)
    {
      ToastHelper.showError(message: httpException.message.toString());
    }on FormatException catch(formException)
    {
      ToastHelper.showError(message: formException.message.toString());
    }on TimeoutException catch(timeOutException)
    {
      ToastHelper.showError(message: timeOutException.message.toString());
    }on HandshakeException catch(handShakeException)
    {
      ToastHelper.showError(message: handShakeException.message.toString());
    }
    catch (error) {
      ToastHelper.showError(message: error.toString());
      return null;
    }

  }

}

class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(
      String method,
      Uri url, {
        required this.onProgress,
      }) : super(method, url);
  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if (total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}


