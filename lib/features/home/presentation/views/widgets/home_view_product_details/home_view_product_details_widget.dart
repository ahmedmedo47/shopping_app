import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home/manager/fetch_one_product/fetch_one_product_cubit.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/custom_appbar_for_details_screen.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/desc_of_product_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeViewProductDetailsWidget extends StatefulWidget {
  const HomeViewProductDetailsWidget({super.key, required this.productId});
  final int productId;

  @override
  State<HomeViewProductDetailsWidget> createState() => _HomeViewProductDetailsWidgetState();
}

class _HomeViewProductDetailsWidgetState extends State<HomeViewProductDetailsWidget> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<FetchOneProductCubit>().fetchOneProducts(id: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<FetchOneProductCubit, FetchOneProductState>(
        builder: (context, state) {
          if (state is FetchOneProductsLoading) {
            // Show a single loading indicator while data is being fetched
            return SizedBox(
              width: width,
              height: height,
              child: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is FetchOneProductsFailure) {
            return SizedBox(
              width: width,
              height: height,
              child: Center(child: Text(state.errorMessage)),
            );
          } else if (state is FetchOneProductsSuccess) {
            final productModel = state.productsList;
            final images = productModel.variants.map((v) => v.image).where((image) => image != null).cast<String>().toList();

            return Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: width,
                      height: height * 3 / 5,
                      child: PageView(
                        controller: _pageController,
                        children: images.map((imageUrl) => Image.network(imageUrl, fit: BoxFit.fill)).toList(),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: images.length,
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
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: DescOfProductDetails(
                        price: productModel.variants.isNotEmpty
                            ? productModel.variants[0].price
                            : 'N/A',
                        product: productModel,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox(
              width: width,
              height: height,
              child: const Center(child: Text('Something went wrong!')),
            );
          }
        },
      ),
    );
  }
}
