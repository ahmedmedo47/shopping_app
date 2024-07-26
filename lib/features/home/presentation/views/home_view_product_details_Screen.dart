import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home/manager/fetch_one_product/fetch_one_product_cubit.dart';
import 'package:shopping_app/features/home/presentation/views/widgets/home_view_product_details/home_view_product_details_widget.dart';

class HomeViewProductDetailsScreen extends StatelessWidget {
  const HomeViewProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int productId = data["id"];

    // Trigger the fetch action using the existing cubit
    context.read<FetchOneProductCubit>().fetchOneProducts(id: productId);

    return Scaffold(
      body: BlocBuilder<FetchOneProductCubit, FetchOneProductState>(
        builder: (context, state) {
          if (state is FetchOneProductsLoading) {
            // Show a single loading indicator while data is being fetched
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchOneProductsFailure) {
            return Center(child: Text(state.errorMessage));
          } else if (state is FetchOneProductsSuccess) {
            final productModel = state.productsList;
            return HomeViewProductDetailsWidget(productModel: productModel);
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}
