import 'dart:convert';

import 'package:api_news/src/resources/api_news_provider.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){
  test('FetchTopIds returns a list of ids', () async {
    // Setup of the test case
    final newsApi = ApiNewsProvider();

    newsApi.client = MockClient((request) async {
      return Response(json.encode([1,2,3,4,5,6,7,8,9]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    // Expectation
    expect(ids, [1,2,3,4,5,6,7,8,9]);
  });

  test('FetchItem returns a item model', () async {
    final newsApi = ApiNewsProvider();

    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final itemModel = await newsApi.fetchItem(999);

    expect(itemModel.id, 123);
  });
}