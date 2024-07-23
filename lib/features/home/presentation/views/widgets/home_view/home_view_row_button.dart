import 'package:flutter/material.dart';
class HomeViewRowButton extends StatelessWidget {
  const HomeViewRowButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Clothes",style: TextStyle(fontSize: 20,color: Colors.black),),
          MaterialButton(onPressed: (){},
            child: InkWell(
              onTap: (){
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
