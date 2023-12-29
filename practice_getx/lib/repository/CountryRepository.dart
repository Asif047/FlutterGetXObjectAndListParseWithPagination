import 'package:dio/dio.dart';
import 'package:practice_getx/model/ModelCountry.dart';

class CountryRepository {
  final Dio _dio;

  CountryRepository(this._dio);

  Future<ModelCountry> getCountries() async {
    try {
      final response = await _dio.get('countries');
      if (response.data['error'] == false) {
        final Map<String, dynamic> data = response.data;
        return ModelCountry.fromJson(data);
      } else {
        // Handle error if needed
        throw Exception(response.data['msg']);
      }
    } catch (e) {
      // Handle Dio errors if needed
      throw Exception("Failed to fetch countries: ${e.toString()}");
    }
  }
}
