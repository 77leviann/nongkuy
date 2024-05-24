part of '../screens/detail/detail_screen.dart';

class DetailController extends GetxController {
  Rx<Status> status = Status.loading.obs;
  Rx<GetRestaurantDetailResponseModel?> restaurantDetail =
      Rx<GetRestaurantDetailResponseModel?>(
    null,
  );
  RxString errorMessage = ''.obs;

  final GetRestaurantService _restaurantService = GetRestaurantService();

  Future<void> getRestaurantDetail(String id) async {
    try {
      status.value = Status.loading;
      final response = await _restaurantService.getRestaurantDetail(id);
      if (!response.error!) {
        status.value = Status.hasData;
        restaurantDetail.value = response;
      } else {
        status.value = Status.noData;
        errorMessage.value = 'Restaurant detail not found.';
      }
    } catch (e) {
      status.value = Status.error;
      errorMessage.value =
          'You are not connected to the internet. Please check your connection.';
    }
  }
}
