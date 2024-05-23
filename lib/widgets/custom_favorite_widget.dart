import 'package:flutter/material.dart';
import 'package:nongkuy/helpers/db_helper.dart';
import 'package:nongkuy/models/local_restaurant_model.dart';

class CustomFavoriteWidget extends StatefulWidget {
  final Restaurant restaurant;
  const CustomFavoriteWidget({
    required this.restaurant,
    super.key,
  });

  @override
  CustomFavoriteWidgetState createState() => CustomFavoriteWidgetState();
}

class CustomFavoriteWidgetState extends State<CustomFavoriteWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavorite();
  }

  Future<void> _checkFavorite() async {
    final dbHelper = DBHelper();
    final favorites = await dbHelper.getFavorites();
    setState(() {
      isFavorite = favorites.any(
        (
          rest,
        ) =>
            rest.id == widget.restaurant.id,
      );
    });
  }

  Future<void> _toggleFavorite() async {
    final dbHelper = DBHelper();
    String message;
    if (isFavorite) {
      await dbHelper.deleteFavorite(
        widget.restaurant.id!,
      );
      message = 'Restaurant favorite removed';
    } else {
      await dbHelper.insertFavorite(
        widget.restaurant,
      );
      message = 'Restaurant favorite added';
    }
    setState(() {
      isFavorite = !isFavorite;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(
            seconds: 1,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
      ),
      onPressed: _toggleFavorite,
      color: isFavorite ? Theme.of(context).colorScheme.error : null,
    );
  }
}
