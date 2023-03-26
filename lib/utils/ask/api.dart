import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  static final dio =
      Dio(BaseOptions(connectTimeout: const Duration(seconds: 4)));
  static final httpClient = http.Client();

  static Future<String> getQnAResponse(String question, String context) async {
    final headers = {'Accept-Charset': 'charset=utf-8', 'Origin': ''};

    final data = json.encode({
      'question': "Q: $question\nA:",
    });

    if (kIsWeb) {
      try {
        final response = await httpClient
            .post(Uri.parse('https://www.uridongnae.com:80/api/qna'),
                headers: headers, body: data)
            .timeout(const Duration(seconds: 4));

        if (response.statusCode == 200) {
          return response.body;
        } else {
          return '현재 API 서버와 연결이 원활하지 않습니다. \n나중에 다시 시도해주세요.';
        }
      } catch (e) {
        return '현재 API 서버와 연결이 원활하지 않습니다. \n나중에 다시 시도해주세요.\n\n($e)';
      }
    } else {
      try {
        final response = await dio.post(
          'https://www.uridongnae.com:80/api/qna',
          data: data,
          queryParameters: headers,
          options: Options(
            responseType: ResponseType.plain,
          ),
        );

        if (response.statusCode == 200) {
          return response.data;
        } else {
          return '현재 API 서버와 연결이 원활하지 않습니다. \n나중에 다시 시도해주세요.';
        }
      } on DioError catch (e) {
        return '현재 API 서버와 연결이 원활하지 않습니다. \n나중에 다시 시도해주세요.\n\n($e)';
      } catch (e) {
        return '현재 API 서버와 연결이 원활하지 않습니다. \n나중에 다시 시도해주세요.\n\n($e)';
      }
    }
  }
}
