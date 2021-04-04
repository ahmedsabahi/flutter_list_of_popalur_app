import 'package:flutter/material.dart';
import 'package:list_of_popular/models/popular.dart';
import 'package:list_of_popular/repositories/popularRepository.dart';

class PopularProvider extends ChangeNotifier {
  int pageKey = 1;
  List<Result> list = [];
  final ScrollController scrollController = ScrollController();

  PopularRepository _popularRepository = PopularRepository();

  PopularProvider() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getList();
      }
    });
    getList();
  }
  void getList() async {
    List<Result> newList = await _popularRepository.fetchPopular(pageKey);
    list = [...list, ...newList];
    notifyListeners();
    pageKey++;
  }
}
