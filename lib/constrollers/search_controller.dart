part of '../screens/search/search_screen.dart';

class SearchController extends GetxController {
  Rx<Status> status = Status.idle.obs;
  RxList<Restaurant> restaurantList = <Restaurant>[].obs;
  TextEditingController searchController = TextEditingController();

  final RestaurantService _restaurantService = RestaurantService();

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> search(
    String query,
  ) async {
    if (query.isEmpty) {
      Get.snackbar(
        'Error',
        'Search query cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(
          seconds: 1,
        ),
      );
      return;
    }

    try {
      status(Status.loading);
      final response = await _restaurantService.getRestaurantSearch(
        query,
      );
      if (!response.error!) {
        if (response.restaurants!.isEmpty) {
          status(Status.noData);
        } else {
          restaurantList.assignAll(response.restaurants!);
          status(Status.hasData);
        }
      } else {
        status(Status.error);
      }
    } catch (e) {
      status(Status.error);
    } finally {
      searchController.clear();
    }
  }

  void clearResults() {
    restaurantList.clear();
    status(
      Status.idle,
    );
  }
}
