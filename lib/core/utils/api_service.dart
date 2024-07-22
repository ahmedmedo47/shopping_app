import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});
  final String baseUrl = 'https://api.escuelajs.co/api/v1/';
  Future<Map<String, dynamic>> get({required String url}) async {
    var response = await dio.get('$baseUrl$url');
    return response.data;
  }
}
