import 'package:flutter/material.dart';
class HomeViewRowButton extends StatelessWidget {
  const HomeViewRowButton({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text( categoryName,style: const TextStyle(fontSize: 20,color: Colors.black),),
          MaterialButton(onPressed: (){},
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "homeViewCategoryDetails",arguments: {
                  "categoryName" : categoryName
                });
              },
              child: const Row(
                children: [
                  Text("Shop Now",style: TextStyle(fontSize: 15,color: Colors.black26),),
                  Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.black26,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
