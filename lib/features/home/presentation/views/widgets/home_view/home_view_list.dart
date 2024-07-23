import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_details_for_list.dart';
class HomeViewList extends StatelessWidget {
  const HomeViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate((context, index){
      return const HomeViewDetailsForList();
    },
      childCount: 10,
      ),
    );
  }
}
