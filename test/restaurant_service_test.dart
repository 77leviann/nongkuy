import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:nongkuy/models/get_restaurant_list_response_model.dart';
import 'package:nongkuy/models/services/restaurant_service.dart';

import 'restaurant_service_test.mocks.dart';

void main() {
  group('RestaurantService', () {
    late MockDio mockDio;
    late RestaurantService restaurantService;

    setUp(() {
      mockDio = MockDio();
      restaurantService = RestaurantService();
      restaurantService.dio = mockDio;
    });

    test(
        'returns a GetRestaurantListResponseModel if the http call completes successfully',
        () async {
      final jsonResponse =  {
          "error": false,
          "message": "success",
          "count": 20,
          "restaurants": [
              {
                  "id": "rqdv5juczeskfw1e867",
                  "name": "Melting Pot",
                  "description": "Lorem ipsum dolor sit amet...",
                  "pictureId": "14",
                  "city": "Medan",
                  "rating": 4.2
              }
          ]
      };

      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await restaurantService.getRestaurantList();

      expect(result, isA<GetRestaurantListResponseModel>());
      expect(result.error, false);
      expect(result.message, 'success');
      expect(result.count, 20);
      expect(result.restaurants?.first.id, 'rqdv5juczeskfw1e867');
      expect(result.restaurants?.first.name, 'Melting Pot');
      expect(result.restaurants?.first.city, 'Medan');
      expect(result.restaurants?.first.rating, 4.2);
    });

    test('throws an exception if the http call completes with an error', () {
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: 'Something went wrong',
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      expect(restaurantService.getRestaurantList(), throwsException);
    });
  });
}
