import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/core/utils/assets.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CartHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CartItem(
                    imageUrl: AssetsData.img2,
                    price: '120.00\u{20AC}',
                    name: 'Nike running pegagus\n36 sneakers in black',
                    size: 'M',
                    quantity: '2X',
                  );
                },
              ),
            ),
            const OrderSummary(),
            const SizedBox(height: 20),
            CheckoutButton(width: width),
          ],
        ),
      ),
    );
  }
}
