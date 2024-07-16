import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/home/data/service/get_books.dart';
import 'package:flutter/material.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/books_widget.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooks();
  }
  List<Item> data = [];
  Future<void> getBooks() async {
    data = await GetBooks().getBooks(endPoint: "volumes?q=horror");
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200, // Adjust the height as needed
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return BooksWidget(item: data[index],data: data,);
          },
          scrollDirection: Axis.horizontal,
        ),
      );
  }
}
