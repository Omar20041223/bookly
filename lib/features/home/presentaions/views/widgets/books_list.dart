import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/books_widget.dart';
import 'package:flutter/material.dart';

class BooksList extends StatelessWidget {
  final List<Item> data;

  const BooksList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust the height as needed
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return BooksWidget(
            item: data[index],
            data: data,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
