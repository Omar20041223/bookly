import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/secondScreen/presentation/views/widgets/widget_for_list.dart';
import 'package:flutter/material.dart';
class ListForSecondScreen extends StatelessWidget {
  final List<Item> data;
  const ListForSecondScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Adjust the height as needed
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return WidgetForList(item: data[index]); // Replace with your actual widget
        },
        scrollDirection: Axis.horizontal,
      ),
    );;
  }
}
