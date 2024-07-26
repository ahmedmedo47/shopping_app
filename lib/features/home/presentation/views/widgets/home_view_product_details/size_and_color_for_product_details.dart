import 'package:flutter/material.dart';

class SizeAndColorForProductDetails extends StatelessWidget {
  final String? selectedSize;
  final ValueChanged<String?> onSizeChanged;

  const SizeAndColorForProductDetails({
    Key? key,
    required this.selectedSize,
    required this.onSizeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _sizes = ['S', 'M', 'L', 'XL'];

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
              const CircleAvatar(
                backgroundColor: Colors.red,
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Size: ",
                style: TextStyle(fontSize: 16),
              ),
              DropdownButton<String>(
                value: selectedSize,
                hint: const Text("Select size"),
                onChanged: (String? newSize) {
                  print("Dropdown selected: $newSize"); // Debug print
                  onSizeChanged(newSize);
                },
                items: _sizes.map((String size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
