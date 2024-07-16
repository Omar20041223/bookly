import 'package:booklyinsession/core/utils/styles.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/best_seller_list.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/best_seller_widget.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/books_list.dart';
import 'package:booklyinsession/features/home/presentaions/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff100B20),
      appBar: AppBar(
        title: CustomAppbar(),
        backgroundColor: Color(0xff100B20),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Text("  Horror Books",style: Styles.textStyle18,),),
            SliverToBoxAdapter(
              child: BooksList()
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: Text("  Computer Books",style: Styles.textStyle18,),),
            BestSellerList()
          ],
        ),
      ),
    );
  }
}
