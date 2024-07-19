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
  final ApiService apiService = ApiService(dio: Dio());
  final HomeRepoImpl homeRepoImpl = HomeRepoImpl(apiService: apiService);
  runApp(MyApp(homeRepoImpl: homeRepoImpl));
}

class MyApp extends StatelessWidget {
  final HomeRepoImpl homeRepoImpl;

  const MyApp({Key? key, required this.homeRepoImpl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllbooksCubit(homeRepoImpl),
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
