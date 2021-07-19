import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "https://api.nasa.gov/mars-photos/api/v1/rovers/",
);

Dio dio = new Dio(options);

class HttpHelper {
  Future<dynamic> get(String endpoint) async {
    try {
      final res = await dio.get(endpoint);
      return res.data;
    } on DioError catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }
}
