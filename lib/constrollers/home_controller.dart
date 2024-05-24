part of '../screens/home/home_screen.dart';

class HomeController extends GetxController {
  Rx<Status> status = Status.loading.obs;
  RxList<Restaurant> restaurantList = <Restaurant>[].obs;
  RxString errorMessage = ''.obs;

  final GetRestaurantService _restaurantService = GetRestaurantService();

  @override
  void onInit() {
    super.onInit();
    getRestaurantList();
  }

  Future<void> getRestaurantList() async {
    try {
      status.value = Status.loading;
      final response = await _restaurantService.getRestaurantList();
      if (response.restaurants!.isEmpty) {
        status.value = Status.noData;
        errorMessage.value = 'Restaurant list not found.';
      } else {
        restaurantList.assignAll(
          response.restaurants!,
        );
        status.value = Status.hasData;
      }
    } catch (e) {
      status.value = Status.error;
      errorMessage.value =
          'You are not connected to the internet. Please check your connection.';
    }
  }
}
