import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_category_details/button_action.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_category_details/category_details_grid_view.dart';

class HomeViewBodyCategoryDetails extends StatelessWidget {
  const HomeViewBodyCategoryDetails({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new),onPressed: (){
            Navigator.of(context).pop();
          },),
          title:  Text(categoryName),
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
