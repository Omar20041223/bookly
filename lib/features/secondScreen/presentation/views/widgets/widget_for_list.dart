import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:flutter/material.dart';
class WidgetForList extends StatelessWidget {
  final Item item;
  const WidgetForList({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(image: NetworkImage("${item.volumeInfo?.imageLinks?.thumbnail}"),fit: BoxFit.fill)
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}
