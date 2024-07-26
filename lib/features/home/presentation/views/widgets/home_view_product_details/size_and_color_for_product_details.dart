import 'package:flutter/material.dart';

class SizeAndColorForProductDetails extends StatelessWidget {
  final String size;
  final Color color;

  const SizeAndColorForProductDetails({
    super.key, required this.size, required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            children: [
              const Text(
                "Color: ",
                style: TextStyle(fontSize: 16),
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 15,
              ),
            ],
          ),
           Text(
            "Size: $size",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
