import 'package:list_of_popular/models/popular.dart';
import 'package:list_of_popular/services/popularService.dart';

class PopularRepository {
  PopularService _popularService = PopularService();
  Future<Popular> fetchPopular() {
    return _popularService.fetchPopular();
  }
}
