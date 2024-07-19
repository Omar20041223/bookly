import 'package:booklyinsession/core/apiService.dart';
import 'package:booklyinsession/core/errors/faliure.dart';
import 'package:booklyinsession/features/home/data/home_repo/home_repo.dart';
import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Faliures, List<Item>>> fetchAllBooks() async{
    try {
      List<Item> booksList = [];
      Map<String, dynamic> jsonData = await apiService.get(endPoint: "volumes?Filtering=free-ebooks&q=subject:");
      List<dynamic> books = jsonData["items"];
      for (var i in books) {
        booksList.add(Item.fromJson(i));
      }
      return right(booksList);
    } on Exception catch (e) {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, List<Item>>> fetchNewestBooks() async{
    try {
      List<Item> booksList = [];
      Map<String, dynamic> jsonData = await apiService.get(endPoint: "volumes?Filtering=free-ebooks&q=subject:&Sorting=newest");
      List<dynamic> books = jsonData["items"];
      for (var i in books) {
        booksList.add(Item.fromJson(i));
      }
      return right(booksList);
    } on Exception catch (e) {
      return left(ServerError(e.toString()));
    }
  }

}