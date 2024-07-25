import 'package:flutter/material.dart';

class CustomAppbarForHomeView extends StatelessWidget {
  const CustomAppbarForHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
          child: Text(
        "Shopping App",
        style: TextStyle(color: Colors.black, fontSize: 20),
      )),
    );
  }
}
