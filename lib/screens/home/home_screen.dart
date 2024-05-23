import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/models/local_restaurant_model.dart';
import 'package:nongkuy/widgets/custom_search_widget.dart';
import 'package:nongkuy/widgets/restaurant_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<LocalRestaurantModel> _futureRestaurants;
  List<Restaurant>? _restaurants;
  List<Restaurant>? _filteredRestaurants;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureRestaurants = loadRestaurantData();
    _futureRestaurants.then((data) {
      setState(() {
        _restaurants = data.restaurants;
        _filteredRestaurants = _restaurants;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<LocalRestaurantModel> loadRestaurantData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/local_restaurant.json');
    return localRestaurantModelFromJson(jsonString);
  }

  void _filterRestaurants(String query) {
    setState(() {
      _filteredRestaurants = _restaurants?.where((restaurant) {
        final nameLower = restaurant.name?.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower!.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant List',
          style: TextStyleConstant.headlineMedium(context),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: FutureBuilder<LocalRestaurantModel>(
          future: _futureRestaurants,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SearchWidget(
                      controller: _searchController,
                      onSubmitted: _filterRestaurants,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          if (_filteredRestaurants == null ||
                              _filteredRestaurants!.isEmpty) {
                            return Center(
                              child: Text(
                                'No Restaurants Found',
                                style: TextStyleConstant.bodyMedium(context),
                              ),
                            );
                          } else if (constraints.maxWidth <= 600) {
                            return RestaurantListWidget(
                                restaurants: _filteredRestaurants);
                          } else if (constraints.maxWidth <= 960) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: RestaurantGridWidget(
                                restaurants: _filteredRestaurants,
                                gridCount: 2,
                              ),
                            );
                          } else if (constraints.maxWidth <= 1200) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 120),
                              child: RestaurantGridWidget(
                                restaurants: _filteredRestaurants,
                                gridCount: 3,
                              ),
                            );
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 160),
                              child: RestaurantGridWidget(
                                restaurants: _filteredRestaurants,
                                gridCount: 4,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
