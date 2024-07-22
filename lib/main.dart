import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';
import 'package:shopping_app/features/search/presentation/views/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        home: SearchView(),
      ),
    );
  }
}
