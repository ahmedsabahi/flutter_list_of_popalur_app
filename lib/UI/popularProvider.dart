import 'package:flutter/material.dart';
import 'package:list_of_popular/models/popular.dart';
import 'package:list_of_popular/repositories/popularRepository.dart';

class PopularProvider extends ChangeNotifier {
  Popular list;

  PopularRepository _popularRepository = PopularRepository();

  PopularProvider() {
    getList();
  }
  void getList() {
    _popularRepository.fetchPopular().then((newList) {
      list = newList;
      notifyListeners();
    });
  }
}
