import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});
  final String baseUrl = "https://api.printful.com/";
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
