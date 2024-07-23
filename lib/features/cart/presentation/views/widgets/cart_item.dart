import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/cart/data/models/cart_item_model.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  const CartItem({
    required this.item,
    required this.onRemove,
    required this.onAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, cartProvider, child) {
        return InkWell(
          onLongPress: onRemove,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      fit: BoxFit.fill,
                      item.imageUrl,
                      width: width * 0.3,
                      height: width * 0.3,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.price.toStringAsFixed(2)}\u{20AC} ',
                      style: GoogleFonts.gabarito(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item.title,
                      style: GoogleFonts.gabarito(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: 35,
                      width: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color(0xFFD8F2E5),
                      ),
                      child: Center(
                        child: Text(
                          item.size,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF08A455),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          '${item.count}X',
                          style: GoogleFonts.gabarito(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        );
      },
    );
  }
}
