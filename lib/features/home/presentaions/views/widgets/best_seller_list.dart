import 'package:booklyinsession/features/home/data/models/books/books/books.dart';
import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/home/data/models/books/books/volume_info.dart';
import 'package:booklyinsession/features/home/data/service/get_books.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/best_seller_widget.dart';
import 'package:flutter/material.dart';
class BestSellerList extends StatefulWidget {
  const BestSellerList({Key? key}) : super(key: key);

  @override
  State<BestSellerList> createState() => _BestSellerListState();
}

class _BestSellerListState extends State<BestSellerList> {
  List<Item> data = [];
  @override
  void initState() {
    // TODO: implement initState
    getBestSellerBooks();
    setState(() {
    });
  }
  Future<void> getBestSellerBooks() async {
    data = await GetBooks().getBooks(endPoint: "volumes?q=computer");
  }
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: BestSeller(item: data[index],data: data,)
          );
        },
        childCount: data.length,
      ),
    );
  }
}
