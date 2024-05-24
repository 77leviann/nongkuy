import 'package:flutter/material.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/models/local_restaurant_model.dart';
import 'package:nongkuy/widgets/restaurant_list_widget.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  final String uniqueTag;

  const DetailScreen({
    super.key,
    required this.restaurant,
    required this.uniqueTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Restaurant',
          style: TextStyleConstant.headlineMedium(context),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: RestaurantDetailItemWidget(
        restaurant: restaurant,
        uniqueTag: uniqueTag,
      ),
    );
  }
}
