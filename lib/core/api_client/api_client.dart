import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_const.dart';
import '../api_exception.dart/api_exception.dart';

class ApiClient {
  Future request(
      {required String path,
      String type = "get",
      Map<String, dynamic> data = const {},
      String token = ""}) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseURl,
        headers: {
          'Content-Type': 'application/json',
          "Accept": 'application/json',
          "Authorization": "Bearer ${ApiConst.apiKey}"
        },
      ),
    );
    try {
      final result = type == "get"
          ? await dio.get(path)
          : await dio.post(path, data: data);
      return result.data;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
