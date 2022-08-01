import 'package:flutter_bloc_app/model/coin.dart';
import 'package:flutter_bloc_app/service/coin_service.dart';

abstract class CoinRepository {
  Future<List<Coin>> fetchData({int? page});
}

class CoinRepositoryImpl implements CoinRepository {
  @override
  Future<List<Coin>> fetchData({int? page}) {
    return CoinService.fetchData(page: page);
  }
}
