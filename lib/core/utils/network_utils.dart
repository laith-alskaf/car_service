import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:car_service/core/enums/request_type.dart';

class NetworkUtil {
  static String baseUrl = '192.168.137.1:5000';
  static var client = http
      .Client(); // حتى استطيع ارسال واصتقبال الطلبات من ال http يجب ان اهيأ متغير من نوع client

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    try {
      //!--- Required for request ----
      //*--- Make full api url ------
      var uri = Uri.http(baseUrl, url, params);
      log('==========> $uri');
      //?--- To Save api response ----
      late http.Response
          response; // حتى يتم استقبال البيانات من http ويتم تاخير تعريفه حتى يتم طلبه
      //?--- To Save api status code ----

      //!--- Required convert ap i response to Map ----
      Map<String, dynamic> jsonResponse = {};

      //*--- Make call correct request type ------
      switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
              await client.post(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.PUT:
          response =
              await client.put(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              body: jsonEncode(body), headers: headers);
          break;
        case RequestType.MULTIPART:
          // TODO: Handle this case.
          break;
      }

      dynamic result;

      try {
        result = jsonDecode(const Utf8Codec().decode(response.bodyBytes));
      } catch (e) {
        e;
      }

      jsonResponse.putIfAbsent(
          'response',
          () => result == null
              ? jsonDecode(jsonEncode(
                  {'title': const Utf8Codec().decode(response.bodyBytes)}))
              : jsonDecode(const Utf8Codec().decode(response.bodyBytes)));
      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);

      log(jsonResponse.toString());

      return jsonResponse;
    } catch (e) {
      (e);
    }
  }
}
