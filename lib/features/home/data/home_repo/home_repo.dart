import 'package:booklyinsession/core/errors/faliure.dart';
import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Faliures,List<Item>>> fetchAllBooks();
  Future<Either<Faliures,List<Item>>> fetchNewestBooks();
}