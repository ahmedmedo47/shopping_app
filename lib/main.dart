import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/home_view_category_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

       // scaffoldBackgroundColor: Color(0xfffffcfc),

      ),
      home: HomeViewCategoryDetails()

    );
  }
}

