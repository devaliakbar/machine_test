import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MakeHttpRequest {
  static const String POST_METHOD = "POST";
  static const String GET_METHOD = "GET";

  static const String ERROR_NO_CONNECTION = "No Internet Connection.";
  static const String ERROR_MSG = "Oops! Something went wrong.";

  static Future<Map> makeHttpRequest({
    @required String path,
    String method = GET_METHOD,
    Map body,
    String timestampOfRequest,
  }) async {
    String requestUrl = Uri.encodeFull(path);

    Map<String, dynamic> returnResponce = new Map();

    http.Response response;

    try {
      if (method == GET_METHOD) {
        response = await http.get(requestUrl);
      } else {
        if (body == null) {
          response = await http.post(requestUrl);
        } else {
          response = await http.post(requestUrl, body: body);
        }
      }
      var jsonResponce = await json.decode(response.body);
      returnResponce['data'] = jsonResponce;
      // if (jsonResponce['success'] && jsonResponce['status'] == 200) {

      // } else {
      //   returnResponce['errorMsg'] = "Oops! Something went wrong.";
      //   // if (jsonResponce.containsKey('message')) {
      //   //   returnResponce['errorMsg'] = jsonResponce['message'];
      //   // }
      // }
    } on SocketException catch (_) {
      returnResponce['errorMsg'] = ERROR_NO_CONNECTION;
    } catch (e) {
      returnResponce['errorMsg'] = ERROR_MSG;
    }

    returnResponce['timestampOfRequest'] = timestampOfRequest;
    return returnResponce;
  }
}
