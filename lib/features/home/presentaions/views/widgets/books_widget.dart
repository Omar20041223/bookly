import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:flutter/material.dart';
class BooksWidget extends StatelessWidget {
  BooksWidget({Key? key, required this.item, required this.data}) : super(key: key);
  final Item item;
  final List<Item> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, "secondScreen",arguments: {
                "bookName" : item.volumeInfo?.title ,
                "author" : item.volumeInfo?.authors,
                "price" : item.saleInfo?.saleability,
                "image" : item.volumeInfo?.imageLinks?.thumbnail,
                "data" : data,
              });
            },
            child: Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: checkImageNull(),fit: BoxFit.fill)
              ),
            ),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
  checkImageNull(){
    if(item.volumeInfo?.imageLinks?.thumbnail != null){
      return NetworkImage("${item.volumeInfo?.imageLinks?.thumbnail}");
    }else{
      return AssetImage("images/Logo.png");
    }
  }

}