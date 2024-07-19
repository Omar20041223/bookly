import 'package:booklyinsession/features/home/data/models/books/books/item.dart';

abstract class AllbooksState {}

class AllbooksInitial extends AllbooksState {}

class AllbooksLoading extends AllbooksState {}

class AllbooksSuccess extends AllbooksState {
  final List<Item> books;

  AllbooksSuccess(this.books);
}

class AllbooksFailure extends AllbooksState {
  final String errorMessage;

  AllbooksFailure(this.errorMessage);
}
