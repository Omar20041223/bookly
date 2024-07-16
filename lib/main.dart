import 'package:booklyinsession/features/home/presentaions/views/homeScreen.dart';
import 'package:booklyinsession/features/secondScreen/presentation/views/secondScreen.dart';
import 'package:booklyinsession/features/splash/presentaions/views/widgets/splah_view.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "homeScreen" :(context)=>HomeScreen(),
        "secondScreen" :(context)=>SecondScreen()
      },
      home: SplashScreen(),
    );
  }
}
