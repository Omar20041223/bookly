import 'package:booklyinsession/core/errors/faliure.dart';
import 'package:booklyinsession/features/home/data/home_repo/home_repo.dart';
import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/home/presentaions/manager/cubit/allbooks_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllbooksCubit extends Cubit<AllbooksState> {
  final HomeRepo homeRepo;

  AllbooksCubit(this.homeRepo) : super(AllbooksInitial());

  Future<void> fetchAllBooks() async {
    emit(AllbooksLoading());
    final Either<Faliures, List<Item>> data = await homeRepo.fetchAllBooks();

    data.fold(
          (failure) => emit(AllbooksFailure(failure.toString())),
          (books) => emit(AllbooksSuccess(books)),
    );
  }

  Future<void> fetchNewestBooks() async {
    emit(AllbooksLoading());
    final Either<Faliures, List<Item>> data = await homeRepo.fetchNewestBooks();

    data.fold(
          (failure) => emit(AllbooksFailure(failure.toString())),
          (books) => emit(AllbooksSuccess(books)),
    );
  }
}
