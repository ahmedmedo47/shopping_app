import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_category_details/custom_action_button.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomTextButton(
              onPressed: (){},
              text: "Sort",
              colorText: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),

            ),
          ),
          Container(
            width: 1.5,
            height: 30,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Expanded(
            child: CustomTextButton(
              onPressed: () {},
              text: "Filter",
              colorText: Colors.black,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
