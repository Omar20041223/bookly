import 'package:flutter/material.dart';
class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/Logo.png"),fit: BoxFit.fill)
            ),
          ),
        Icon(Icons.search,size: 30,color: Colors.white,)
      ],
    );
  }
}
