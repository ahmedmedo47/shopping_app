import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';

class SearchResults extends StatelessWidget {
  final SearchProvider searchProvider;

  const SearchResults({super.key, required this.searchProvider});

  @override
  Widget build(BuildContext context) {
    return searchProvider.searchResults.isEmpty
        ? _buildNoResultsFound()
        : _buildResultsList();
  }

  Widget _buildNoResultsFound() {
    return Center(
      child: Text(
        'No results found',
        style: GoogleFonts.gabarito(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildResultsList() {
    return ListView.builder(
      itemCount: searchProvider.searchResults.length,
      itemBuilder: (context, index) {
        final result = searchProvider.searchResults[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                result.image.toString(),
                width: 80.0,
                height: 80.0,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
              result.title.toString(),
              style: GoogleFonts.gabarito(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              result.description.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.gabarito(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/homeViewProductDetailsScreen',
                arguments: result.id,
              );
            },
          ),
        );
      },
    );
  }
}
