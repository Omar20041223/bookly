import 'package:booklyinsession/core/apiService.dart';
import 'package:booklyinsession/core/errors/faliure.dart';
import 'package:booklyinsession/features/home/data/home_repo/home_repo_impl.dart';
import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/home/presentaions/manager/cubit/allbooks_state.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllbooksCubit extends Cubit<AllbooksState> {
  AllbooksCubit() : super(AllbooksInitial());

  Future<void> getBooks() async {
    emit(AllbooksLoading());
    final Either<Faliures, List<Item>> data =
        await HomeRepoImpl(apiService: ApiService(dio: Dio())).fetchAllBooks();
    data.fold(
      (failure) {
        String errorMessage;
        if (failure is ServerError) {
          errorMessage =
              'Server Error: Unable to fetch books. Please try again later.';
        } else {
          errorMessage = 'Unexpected Error: ${failure.toString()}';
        }
        emit(AllbooksFailure(errorMessage));
      },
      (books) => emit(AllbooksSuccess(books)),
    );
  }
}
