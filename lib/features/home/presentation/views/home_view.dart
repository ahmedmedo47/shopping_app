import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_widget.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ShoppingApp",
          style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.w700),),),
      backgroundColor: const Color(0xffD6DAD8),
      body: const Padding(
        padding: EdgeInsets.only(top: 20),
        child: HomeViewWidget(categoryName: "Clothes",),
      ),
    );
  }
}
