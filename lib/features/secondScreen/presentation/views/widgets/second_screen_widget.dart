import 'package:booklyinsession/core/utils/styles.dart';
import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:booklyinsession/features/secondScreen/presentation/views/widgets/list.dart';
import 'package:flutter/material.dart';
class SecondScreenWidget extends StatelessWidget {
  final String image;
  final List<String> author;
  final String price;
  final String bookName;
  final List<Item> data;

  const SecondScreenWidget({super.key, required this.image, required this.author, required this.price, required this.bookName, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 240,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(image:NetworkImage("$image"),fit: BoxFit.fill),
          ),
        ),
        SizedBox(height: 40,),
        Text("$bookName",style: Styles.textStyle20,),
        Text("$author",style: Styles.textStyle18,),
        SizedBox(height: 60,),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 48,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text("$price",style: TextStyle(fontSize: 20,color: Colors.black),),
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text("Free preview",style: Styles.textStyle16,),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Container(
            alignment: Alignment.centerLeft,
              child: Text("You can also like",style: Styles.textStyle16)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: ListForSecondScreen(data: data),
        )



      ],
    );
  }
}
