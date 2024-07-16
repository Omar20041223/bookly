import 'package:booklyinsession/features/home/data/models/books/books/item.dart';
import 'package:flutter/material.dart';

import 'widgets/second_screen_widget.dart';
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String image = data["image"];
    List<String> author = data["author"];
    String bookName = data["bookName"];
    String price = data["price"];
    List<Item> apiData = data["data"];
    return Scaffold(
      backgroundColor: Color(0xff100B20),
      appBar:AppBar(
        backgroundColor: Color(0xff100B20),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.white,),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SecondScreenWidget(image: image, author: author, price: price, bookName: bookName, data: apiData,),
    );
  }
}
