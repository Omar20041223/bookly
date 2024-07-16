import 'package:booklyinsession/core/apiService.dart';
import 'package:booklyinsession/features/home/data/models/books/books/books.dart';
import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/home/data/models/books/books/volume_info.dart';
import 'package:dio/dio.dart';

class GetBooks {
  getBooks({required String endPoint}) async{
    List<Item> booksList = [];
    Map<String, dynamic> jsonData = await ApiService(dio: Dio()).get(endPoint: endPoint);
    List<dynamic> books = jsonData["items"];
    for (var i in books) {
      booksList.add(Item.fromJson(i));
    }
    return booksList;
  }
}
