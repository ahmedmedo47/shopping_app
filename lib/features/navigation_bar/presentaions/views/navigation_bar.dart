import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/presentation/views/cart_view.dart';
import 'package:shopping_app/features/home/presentation/views/favorite_view.dart';
import 'package:shopping_app/features/home/presentation/views/home_view.dart';
import 'package:shopping_app/features/search/presentation/views/search_view.dart';
class NavigationBarForApp extends StatefulWidget {
  const NavigationBarForApp({super.key});

  @override
  State<NavigationBarForApp> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarForApp> {
  int selectedIndex = 0 ;
  List<Widget> views = [const HomeView(),const SearchView(),const CartView(),const FavoriteView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: "favourite")
        ],),
      backgroundColor: const Color(0xffD6DAD8),
      body: views.elementAt(selectedIndex)
    );
  }
}
