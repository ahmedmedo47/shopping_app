import 'package:flutter/material.dart';
class CustomAppbarForDetailsScreen extends StatelessWidget {
  const CustomAppbarForDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Center(
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.shopping_cart_rounded,color: Colors.black,),
                  onPressed: (){
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
