import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/cart/presentation/manager/cart_provider.dart';
import 'package:shopping_app/features/cart/presentation/views/widgets/cart_header.dart';
import 'package:shopping_app/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:shopping_app/features/cart/presentation/views/widgets/checkout_button.dart';
import 'package:shopping_app/features/cart/presentation/views/widgets/order_summary.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Your Cart',
          style: GoogleFonts.gabarito(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CartHeader(),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.products.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.products[index];
                      return CartItem(
                        item: item,
                        onRemove: () {},
                        onAdd: () {},
                      );
                    },
                  ),
                ),
                const OrderSummary(),
                const SizedBox(height: 20),
                CheckoutButton(width: width),
              ],
            ),
          );
        },
      ),
    );
  }
}