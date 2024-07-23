import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_container_details_for_list.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view/home_view_row_button.dart';
class HomeViewDetailsForList extends StatelessWidget {
  const HomeViewDetailsForList({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeViewRowButton(),
          SizedBox(
            height: height * 0.5,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,item){
                  return  HomeViewContainerDetailsForList(image: "assets/images/1.jpg",price: "27,99 Є",);
                }),
          ),
        ],
      ),
    );
  }
}
