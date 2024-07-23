import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/utils/assets.dart';
import 'package:shopping_app/features/search/presentation/manager/search_provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 70.0, left: 12.0, right: 12.0, bottom: 8.0),
        child: Consumer<SearchProvider>(
          builder: (context, searchProvider, child) {
            return Column(
              children: [
                TextFormField(
                  onChanged: (value) => searchProvider.performSearch(),
                  controller: searchProvider.textController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFEEEEEE),
                    filled: true,
                    hintText: 'Search...',
                    hintStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
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
                if (searchProvider.isSearching) ...[
                  Expanded(
                    child: ListView.builder(
                      itemCount: searchProvider.searchResults.length,
                      itemBuilder: (context, index) {
                        final result = searchProvider.searchResults[index];
                        return ListTile(
                          title: Text(result),
                          onTap: () {
                            Navigator.pushNamed(context, '/details',
                                arguments: result);
                          },
                        );
                      },
                    ),
                  ),
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
                          onTap: () {},
                          child: GridTile(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          AssetsData.img2,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Clothing',
                                      style: GoogleFonts.gabarito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
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
