import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';

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
        child: Consumer<SearchProvider>(
          builder: (context, searchProvider, child) {
            return Column(
              children: [
                Padding(
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
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          searchProvider.clearSearch();
                        },
                      ),
                    ),
                  ),
                ),
                if (searchProvider.isLoading) ...[
                  Expanded(
                      child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8.0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const CircularProgressIndicator(
                        strokeWidth: 6.0,
                      ),
                      Positioned(
                        bottom: 50,
                        child: Text(
                          'Loading...',
                          style: GoogleFonts.gabarito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
                ] else if (searchProvider.isSearching) ...[
                  Expanded(
                    child: searchProvider.searchResults.isEmpty
                        ? Center(
                            child: Text(
                              'No results found',
                              style: GoogleFonts.gabarito(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: searchProvider.searchResults.length,
                            itemBuilder: (context, index) {
                              final result =
                                  searchProvider.searchResults[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
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
                          ),
                  )
                ] else ...[
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                context, '/homeViewCategoryDetails',
                                arguments: category);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
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
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
