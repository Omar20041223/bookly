import 'package:booklyinsession/core/utils/styles.dart';
import 'package:booklyinsession/features/home/presentaions/manager/cubit/allbooks_cubit.dart';
import 'package:booklyinsession/features/home/presentaions/manager/cubit/allbooks_state.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/best_seller_list.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/books_list.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AllbooksCubit>().fetchAllBooks();
    context.read<AllbooksCubit>().fetchNewestBooks();

    return Scaffold(
      backgroundColor: const Color(0xff100B20),
      appBar: AppBar(
        title: CustomAppbar(),
        backgroundColor: const Color(0xff100B20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<AllbooksCubit, AllbooksState>(
          builder: (context, state) {
            if (state is AllbooksLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AllbooksSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BooksList(data: state.books),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  const SliverToBoxAdapter(
                    child: Text(
                      "  Newest Books",
                      style: Styles.textStyle18,
                    ),
                  ),
                  BestSellerList(data: state.books),
                ],
              );
            } else if (state is AllbooksFailure) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
