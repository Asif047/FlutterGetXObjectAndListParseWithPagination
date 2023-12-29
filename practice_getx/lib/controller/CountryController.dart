import 'package:get/get.dart';
import 'package:practice_getx/model/ModelCountry.dart';
import 'package:practice_getx/repository/CountryRepository.dart';

class CountryController extends GetxController {
  final CountryRepository _countryRepository;
  late final Rx<ModelCountry> _country;

  CountryController(this._countryRepository);

  ModelCountry get country => _country.value;

  @override
  onInit() {
    super.onInit();
    _country = ModelCountry(error: false, msg: "", data: []).obs;
    _getAllCountries();
  }

  Future<void> _getAllCountries() async {
    try {
      final countryData = await _countryRepository.getCountries();
      _country.value = countryData;
    } catch (e) {
      // Handle error if needed
      print("Error fetching countries: $e");
    }
  }
}
