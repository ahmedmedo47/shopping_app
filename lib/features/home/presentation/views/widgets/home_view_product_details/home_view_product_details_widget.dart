import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/custom_appbar_for_details_screen.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/product_details_tile.dart';

class HomeViewProductDetailsWidget extends StatefulWidget {
  HomeViewProductDetailsWidget({Key? key}) : super(key: key);

  @override
  State<HomeViewProductDetailsWidget> createState() => _HomeViewProductDetailsWidgetState();
  bool addedToTheCart = false;
}

class _HomeViewProductDetailsWidgetState extends State<HomeViewProductDetailsWidget> {
  final PageController _pageController = PageController();

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
                  Image.asset('assets/images/black-smooth-textured-paper-background.jpg', fit: BoxFit.fill),
                  Image.asset('assets/images/download (1).png', fit: BoxFit.fill),
                  Image.asset('assets/images/HD-wallpaper-patchwork-red-screen-usa.jpg', fit: BoxFit.fill),
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
                  count: 3,  // Number of pages
                  effect: ExpandingDotsEffect(
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
            CustomAppbarForDetailsScreen(),
          ],
        ),
        Expanded(
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15), topRight: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "120,00 Є",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        "Details",
                        style: TextStyle(color: Colors.black38, fontSize: 14),
                      ),
                      ProductDetailsTile(title: 'title', description: 'description'),
                      ProductDetailsTile(title: 'title', description: 'description'),
                      ProductDetailsTile(title: 'title', description: 'description'),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: (){
                              _messageAlret("title", "text");
                            },
                            child: Container(
                              width: 240,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: Text("+ Add To Cart",style: TextStyle(fontSize: 20,color: Colors.white),)),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffecf0ec),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: IconButton(
                              icon: Icon(
                                widget.addedToTheCart ? Icons.favorite : Icons.favorite_border,
                                color: widget.addedToTheCart ? Colors.red : Colors.black,
                              ),
                              onPressed: (){
                                setState(() {
                                  widget.addedToTheCart = !widget.addedToTheCart;
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
          title: Text(title, style: TextStyle(fontSize: 30)),
          content: Text(text, style: TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
