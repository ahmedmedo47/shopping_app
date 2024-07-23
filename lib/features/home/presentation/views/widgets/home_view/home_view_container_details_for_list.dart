import 'package:flutter/material.dart';
class HomeViewContainerDetailsForList extends StatelessWidget {
  const HomeViewContainerDetailsForList({Key? key, required this.image, required this.price}) : super(key: key);
  final String image;
  final String price;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, "HomeViewProductDetailsScreen",arguments: {
              "image" : image,
              "price" : price,
            });
          },
          child: Container(
            width: width * 0.6,
            height: height * 0.5,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height*.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image:  DecorationImage(image: AssetImage("$image"),fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(height: 10,),
                 Padding(
                  padding:  EdgeInsets.only(left: 20.0),
                  child:  Text("$price",style: TextStyle(fontSize: 20,color: Colors.black),),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 20.0),
                  child:  Text("Noisy May short oversized sweatshirt in gray",style: TextStyle(fontSize: 15,color: Colors.black26),),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 20,)
      ],
    );
  }
}
