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
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          centerTitle: true,
          leading: Icon(Icons.arrow_back_ios_new),
          title: Text("Category"),
        ),
      ),
      body: ListView(
       // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 18),
        children: [
          SizedBox(height: 12),
          ButtonAction(), // تأكد من تعريف هذا الودجت بشكل صحيح
          SizedBox(height: 20),
          CategoryDetailsGridView(), // تأكد من تعريف هذا الودجت بشكل صحيح
        ],
      ),
    );
  }
}
