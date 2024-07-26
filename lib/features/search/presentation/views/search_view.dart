import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';
import 'widgets/search_text_field.dart';
import 'widgets/loading_indicator.dart';
import 'widgets/search_results.dart';
import 'widgets/category_grid.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final searchProvider =
          Provider.of<SearchProvider>(context, listen: false);
      searchProvider.fetchCategories();
      searchProvider.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0, bottom: 6.0),
        child: Column(
          children: [
            const SearchTextField(), 
            Expanded(
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  if (searchProvider.isLoading) {
                    return const LoadingIndicator();
                  } else if (searchProvider.isSearching) {
                    return SearchResults(searchProvider: searchProvider);
                  } else {
                    return CategoryGrid(searchProvider: searchProvider);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
