import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/button_action.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/category_details_grid_view.dart';

class HomeViewBodyCategoryDetails extends StatelessWidget {
  const HomeViewBodyCategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          leading: const Icon(Icons.arrow_back_ios_new),
          title: const Text("Category"),
        ),
      ),
      body: ListView(
       // physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: const [
          SizedBox(height: 12),
          ButtonAction(), // تأكد من تعريف هذا الودجت بشكل صحيح
          SizedBox(height: 20),
          CategoryDetailsGridView(), // تأكد من تعريف هذا الودجت بشكل صحيح
        ],
      ),
    );
  }
}
