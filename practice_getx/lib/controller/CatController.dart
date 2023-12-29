import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_getx/model/ModelCatList.dart';
import 'package:practice_getx/model/PaginationFilter.dart';
import 'package:practice_getx/repository/CatRepository.dart';

class CatController extends GetxController {
  final CatRepository _catRepository;
  final _cats = <ModelCatList>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  //for pagination

  CatController(this._catRepository);

  List<ModelCatList> get cats => _cats.toList();

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  @override
  onInit() {
    ever(_paginationFilter, (_) => _getAllCats());
    _changePaginationFilter(1, 15);
    super.onInit();
  }



  Future<void> _getAllCats() async {
    final catData = await _catRepository.getCats(_paginationFilter.value);

    if (catData.isEmpty) {
      _lastPage.value = true;
      print("data is empty");
    }
    //_users.addAll(usersData);

    if(catData.length > 0) {
      isMoreDataAvailable(true);
    } else{
      isMoreDataAvailable(false);
    }

    for(int i = 0; i < catData.length; i++) {
      _cats.add(catData[i]);
    }
  }


  void changeTotalPerPage(int limitValue) {
    _cats.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
}
