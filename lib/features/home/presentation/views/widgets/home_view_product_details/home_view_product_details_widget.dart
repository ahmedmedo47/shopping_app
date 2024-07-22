import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/custom_appbar_for_details_screen.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/product_details_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeViewProductDetailsWidget extends StatefulWidget {
  const HomeViewProductDetailsWidget({super.key});

  @override
  State<HomeViewProductDetailsWidget> createState() =>
      _HomeViewProductDetailsWidgetState();
}

class _HomeViewProductDetailsWidgetState
    extends State<HomeViewProductDetailsWidget> {
  final PageController _pageController = PageController();
  bool addedToTheCart = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: width,
              height: height * 3 / 5,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset(
                      'assets/images/black-smooth-textured-paper-background.jpg',
                      fit: BoxFit.fill),
                  Image.asset('assets/images/download (1).png',
                      fit: BoxFit.fill),
                  Image.asset(
                      'assets/images/HD-wallpaper-patchwork-red-screen-usa.jpg',
                      fit: BoxFit.fill),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3, // Number of pages
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 16,
                    expansionFactor: 4,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                  ),
                ),
              ),
            ),
            const CustomAppbarForDetailsScreen(),
          ],
        ),
        Expanded(
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Container(
              width: width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "120,00 Є",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      const Text(
                        "Details",
                        style: TextStyle(color: Colors.black38, fontSize: 14),
                      ),
                      const ProductDetailsTile(
                          title: 'title', description: 'description'),
                      const ProductDetailsTile(
                          title: 'title', description: 'description'),
                      const ProductDetailsTile(
                          title: 'title', description: 'description'),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              _messageAlret("title", "text");
                            },
                            child: Container(
                              width: 240,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                  child: Text(
                                "+ Add To Cart",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color(0xffecf0ec),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              icon: Icon(
                                addedToTheCart
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color:
                                    addedToTheCart ? Colors.red : Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  addedToTheCart = addedToTheCart;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _messageAlret(String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: const TextStyle(fontSize: 30)),
          content: Text(text, style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
