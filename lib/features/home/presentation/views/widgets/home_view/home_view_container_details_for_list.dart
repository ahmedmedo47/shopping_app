import 'package:flutter/material.dart';
class HomeViewContainerDetailsForList extends StatefulWidget {
   HomeViewContainerDetailsForList({super.key, required this.image, required this.price});
  final String image;
  final String price;
  bool addedToTheCart = false;

  @override
  State<HomeViewContainerDetailsForList> createState() => _HomeViewContainerDetailsForListState();
}

class _HomeViewContainerDetailsForListState extends State<HomeViewContainerDetailsForList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, "homeViewProductDetailsScreen",arguments: {
              "image" : widget.image,
              "price" : widget.price,
            });
          },
          child: Stack(
            children: [
              Container(
                width: width * 0.6,
                height: height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height*.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image:  DecorationImage(image: AssetImage(widget.image),fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(height: 10,),
                     Padding(
                      padding:  const EdgeInsets.only(left: 15.0),
                      child:  Text(widget.price,style: const TextStyle(fontSize: 20,color: Colors.black),),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(left: 15.0),
                      child:  Text("Noisy May short oversized sweatshirt in gray",style: TextStyle(fontSize: 15,color: Colors.black26),),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: height * .15,
                right: 2,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffecf0ec),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.addedToTheCart = !widget.addedToTheCart;
                      });
                    },
                    icon: Icon(
                      widget.addedToTheCart
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                      widget.addedToTheCart ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20,)
      ],
    );
  }
}
