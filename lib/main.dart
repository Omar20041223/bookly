import 'package:booklyinsession/core/apiService.dart';
import 'package:booklyinsession/features/home/data/home_repo/home_repo_impl.dart';
import 'package:booklyinsession/features/home/presentaions/manager/cubit/allbooks_cubit.dart';
import 'package:booklyinsession/features/home/presentaions/views/homeScreen.dart';
import 'package:booklyinsession/features/secondScreen/presentation/views/secondScreen.dart';
import 'package:booklyinsession/features/splash/presentaions/views/widgets/splah_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllbooksCubit(HomeRepoImpl(apiService: ApiService(dio: Dio()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "homeScreen": (context) => HomeScreen(),
          "secondScreen": (context) => SecondScreen(),
        },
        home: SplashScreen(),
      ),
    );
  }
}