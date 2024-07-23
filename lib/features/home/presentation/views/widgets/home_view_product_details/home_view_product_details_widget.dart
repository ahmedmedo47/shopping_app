import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/custom_appbar_for_details_screen.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/desc_of_product_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeViewProductDetailsWidget extends StatefulWidget {
  const HomeViewProductDetailsWidget({super.key, required this.price});
  final String price;

  @override
  State<HomeViewProductDetailsWidget> createState() =>
      _HomeViewProductDetailsWidgetState();
}

class _HomeViewProductDetailsWidgetState
    extends State<HomeViewProductDetailsWidget> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
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
              child:  DescOfProductDetails(price: widget.price,)
            ),
          ),
        ),
      ],
    );
  }

}
