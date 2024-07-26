import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';

class CategoryGrid extends StatelessWidget {
  final SearchProvider searchProvider;

  const CategoryGrid({super.key, required this.searchProvider});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: searchProvider.categories.length,
      itemBuilder: (context, index) {
        final category = searchProvider.categories[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/homeViewCategoryDetails',
              arguments: category.id,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GridTile(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          category.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category.title,
                      style: GoogleFonts.gabarito(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
