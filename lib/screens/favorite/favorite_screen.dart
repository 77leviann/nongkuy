import 'package:flutter/material.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/helpers/db_helper.dart';
import 'package:nongkuy/models/local_restaurant_model.dart';
import 'package:nongkuy/widgets/restaurant_list_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  late DBHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites Restaurants',
          style: TextStyleConstant.headlineMedium(context),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: StreamBuilder<List<Restaurant>>(
        stream: dbHelper.favoriteStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Favorites Restaurant Yet'));
          } else {
            final favorites = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth <= 600) {
                    return RestaurantListWidget(restaurants: favorites);
                  } else if (constraints.maxWidth <= 960) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: RestaurantGridWidget(
                        restaurants: favorites,
                        gridCount: 2,
                      ),
                    );
                  } else if (constraints.maxWidth <= 1200) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: RestaurantGridWidget(
                        restaurants: favorites,
                        gridCount: 3,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 160),
                      child: RestaurantGridWidget(
                        restaurants: favorites,
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
    );
  }

  @override
  void dispose() {
    dbHelper.dispose();
    super.dispose();
  }
}
