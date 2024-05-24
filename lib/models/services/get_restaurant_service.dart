import 'package:dio/dio.dart';
import 'package:nongkuy/models/get_restaurant_detail_response_model.dart';
import 'package:nongkuy/models/get_restaurant_list_response_model.dart';
import 'package:nongkuy/models/get_restaurant_search_response_model.dart';
import 'package:nongkuy/utils/base_url_util.dart';
import 'package:flutter/foundation.dart';

class GetRestaurantService {
  final Dio dio = Dio();

  Future<GetRestaurantListResponseModel> getRestaurantList() async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.baseUrl}/list',
      );
      if (response.statusCode == 200) {
        return GetRestaurantListResponseModel.fromJson(
          response.data,
        );
      } else {
        if (kDebugMode) {
          print(
            'Error: Failed to load restaurant list. Status code: ${response.statusCode}',
          );
        }
        throw Exception(
          'Failed to load restaurant list',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception(
        'Failed to load restaurant list',
      );
    }
  }

  Future<GetRestaurantDetailResponseModel> getRestaurantDetail(
      String id) async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.baseUrl}/detail/$id',
      );
      if (response.statusCode == 200) {
        return GetRestaurantDetailResponseModel.fromJson(
          response.data,
        );
      } else {
        if (kDebugMode) {
          print(
            'Error: Failed to load restaurant detail. Status code: ${response.statusCode}',
          );
        }
        throw Exception(
          'Failed to load restaurant detail',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(
          'Error: $e',
        );
      }
      throw Exception(
        'Failed to load restaurant detail',
      );
    }
  }

  Future<GetRestaurantSearchResponseModel> getRestaurantSearch(
      String query) async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.baseUrl}/search?q=$query',
      );
      if (response.statusCode == 200) {
        return GetRestaurantSearchResponseModel.fromJson(
          response.data,
        );
      } else {
        if (kDebugMode) {
          print(
            'Error: Failed to search restaurant. Status code: ${response.statusCode}',
          );
        }
        throw Exception(
          'Failed to search restaurantl',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception(
        'Failed to search restaurant',
      );
    }
  }
}
