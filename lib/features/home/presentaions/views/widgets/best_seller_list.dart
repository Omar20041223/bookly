import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/best_seller_widget.dart';
import 'package:flutter/material.dart';

class BestSellerList extends StatelessWidget {
  final List<Item> data;

  const BestSellerList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: BestSeller(item: data[index], data: data),
          );
        },
        childCount: data.length,
      ),
    );
  }
}
