import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_model.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoinModel>> getCoinsList();
}