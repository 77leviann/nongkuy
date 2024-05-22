import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/models/local_restaurant_model.dart';
import 'package:nongkuy/widgets/restaurant_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<LocalRestaurantModel> _futureRestaurants;

  @override
  void initState() {
    super.initState();
    _futureRestaurants = loadRestaurantData();
  }

  Future<LocalRestaurantModel> loadRestaurantData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/local_restaurant.json');
    return localRestaurantModelFromJson(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant List',
          style: TextStyleConstant.headlineMedium(context),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary,
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
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth <= 600) {
                      return RestaurantListWidget(
                          restaurants: snapshot.data!.restaurants);
                    } else if (constraints.maxWidth <= 960) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: RestaurantGridWidget(
                          restaurants: snapshot.data!.restaurants,
                          gridCount: 2,
                        ),
                      );
                    } else if (constraints.maxWidth <= 1200) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120),
                        child: RestaurantGridWidget(
                          restaurants: snapshot.data!.restaurants,
                          gridCount: 3,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 160),
                        child: RestaurantGridWidget(
                          restaurants: snapshot.data!.restaurants,
                          gridCount: 4,
                        ),
                      );
                    }
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
