import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/helpers/db_helper.dart';
import '../models/get_restaurant_list_response_model.dart';

part '../constrollers/custom_favorite_controller.dart';

class FavoriteWidget extends StatelessWidget {
  final Restaurant restaurant;
  final FavoriteController favoriteController = Get.find();

  FavoriteWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isFavorite = favoriteController.favorites.any(
        (
          element,
        ) =>
            element.id == restaurant.id,
      );
      return IconButton(
        icon: AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeInOut,
          transform: isFavorite
              ? Matrix4.rotationY(
                  0.5,
                )
              : Matrix4.rotationY(
                  0,
                ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite
                ? Theme.of(
                    context,
                  ).colorScheme.error
                : null,
          ),
        ),
        onPressed: () async {
          if (isFavorite) {
            await favoriteController.removeFavorite(
              restaurant.id!,
            );
          } else {
            await favoriteController.addFavorite(
              restaurant,
            );
          }
        },
      );
    });
  }
}
