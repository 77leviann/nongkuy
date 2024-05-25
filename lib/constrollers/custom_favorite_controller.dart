part of '../widgets/custom_favorite_widget.dart';

class FavoriteController extends GetxController {
  RxList<Restaurant> favorites = <Restaurant>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    var favoriteList = await DBHelper.db.getFavorites();
    favorites.assignAll(favoriteList);
  }

  Future<void> addFavorite(Restaurant restaurant) async {
    await DBHelper.db.insertFavorite(restaurant);
    favorites.add(restaurant);
    Get.snackbar(
      'Favorite Added',
      '${restaurant.name} has been added to your favorites',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }

  Future<void> removeFavorite(String id) async {
    final restaurant =
        favorites.firstWhere((restaurant) => restaurant.id == id);
    await DBHelper.db.deleteFavorite(id);
    favorites.removeWhere((restaurant) => restaurant.id == id);
    Get.snackbar(
      'Favorite Removed',
      '${restaurant.name} has been removed from your favorites',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }

  Future<bool> isFavorite(String id) async {
    return favorites.any((restaurant) => restaurant.id == id);
  }
}
