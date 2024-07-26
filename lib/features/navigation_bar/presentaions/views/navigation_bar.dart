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
  int selectedIndex = 0;
  final List<Widget> _views = [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const FavoriteView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "Favorite",
          ),
        ],
      ),
      backgroundColor: const Color(0xffD6DAD8),
      body: IndexedStack(
        index: selectedIndex,
        children: _views,
      ),
    );
  }
}
