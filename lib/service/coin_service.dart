import 'dart:convert';
import 'package:flutter_bloc_app/apikey.dart';
import 'package:http/http.dart';
import 'package:flutter_bloc_app/model/coin.dart';

class CoinService {
  static final _client = Client();
  static const String _baseURL = "https://min-api.cryptocompare.com";
  static const int _perPage = 20;

  static Future<List<Coin>> fetchData({int? page}) async {
    final response = await _client.get(Uri.parse(
        '$_baseURL/data/top/totalvolfull?limit=$_perPage&tsym=USD&page=$page&api_key=$APIKEY'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> coins = data['Data'];
      return coins.map((e) => Coin.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get data');
    }
  }
}
