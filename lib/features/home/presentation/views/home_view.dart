import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_details_for_list.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_widget.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        centerTitle: true,
      ),
      body: HomeViewWidget(),
    );
  }
}
