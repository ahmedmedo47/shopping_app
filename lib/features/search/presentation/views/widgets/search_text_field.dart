import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        onChanged: (value) => searchProvider.performSearch(),
        controller: searchProvider.textController,
        decoration: InputDecoration(
          fillColor: const Color(0xFFEEEEEE),
          filled: true,
          hintText: 'Search for products...',
          hintStyle: const TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              searchProvider.clearSearch();
            },
          ),
        ),
      ),
    );
  }
}
