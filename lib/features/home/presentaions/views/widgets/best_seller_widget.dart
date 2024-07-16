import 'package:booklyinsession/core/utils/styles.dart';
import 'package:booklyinsession/features/home/data/models/books/books/books.dart';
import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/home/data/models/books/books/volume_info.dart';
import 'package:flutter/material.dart';
class BestSeller extends StatelessWidget {
   BestSeller({Key? key, required this.item, required this.data}) : super(key: key);
  final Item item;
  final List<Item> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, "secondScreen",arguments: {
          "bookName" : item.volumeInfo?.title ,
          "author" : item.volumeInfo?.authors,
          "price" : item.saleInfo?.saleability,
          "image" : item.volumeInfo?.imageLinks?.thumbnail,
          "data" : data,
        });
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 130,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: NetworkImage("${item.volumeInfo?.imageLinks?.thumbnail}"),fit: BoxFit.fill)
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${item.volumeInfo?.title}",style: Styles.textStyle20,maxLines: 2,overflow: TextOverflow.ellipsis,),
                Text("${item.volumeInfo?.authors}",style: Styles.textStyle14,),
                Text("${item.saleInfo?.saleability}",style: Styles.textStyle20)
              ],
            ),
          )
        ],
      ),
    );
  }
}
