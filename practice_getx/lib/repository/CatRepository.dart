import 'package:dio/dio.dart';
import 'package:practice_getx/model/ModelCatList.dart';
import 'package:practice_getx/model/PaginationFilter.dart';

class CatRepository {
  Dio _dio;

  CatRepository(
      this._dio,
      );



  Future<List<ModelCatList>> getCats(PaginationFilter filter) async {
    try {
      // Perform GET request to the endpoint "/users/<id>"
      Response catData = await _dio.get('v1/images/search', queryParameters: {
        'page': filter.page,
        'limit': filter.limit
      });

      // Parse the raw data and convert it into a list of ModelCatList
      List<ModelCatList> catList = (catData.data as List)
          .map((jsonObject) => ModelCatList.fromJson(jsonObject))
          .toList();

      // Prints the parsed data
      print('Cat List: $catList');

      // Return the list wrapped in a Future
      return catList;
    } catch (error) {
      // Handle errors if necessary
      print('Error fetching cat data: $error');
      throw error; // You might want to handle the error more gracefully
    }
  }


}
