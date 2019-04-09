import 'dart:async';
import 'api_news_provider.dart';
import 'db_news_provider.dart';
import '../models/item_model.dart';

class Repository {
  NewsDbProvier dbProvider = NewsDbProvier();
  ApiNewsProvider apiProvider = ApiNewsProvider();

  Future<List<int>> fetchTopIds(){
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null){
      return item;
    }

    item = await apiProvider.fetchItem(id);

    dbProvider.addItem(item);

    return item;
  }
}