import 'package:dio/dio.dart';

class ApiService{
  final baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio dio;
  ApiService({required this.dio});
  get({required String endPoint}) async{
    final link = "$baseUrl$endPoint";
    var response = await dio.get("$link");
    return response.data;
  }
}