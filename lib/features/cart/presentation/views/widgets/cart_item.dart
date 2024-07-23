import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String name;
  final String size;
  final String quantity;

  const CartItem({
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.size,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                fit: BoxFit.fill,
                imageUrl,
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
                price,
                style: GoogleFonts.gabarito(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                name,
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
                    size,
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
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text(
                    quantity,
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
    );
  }
}
