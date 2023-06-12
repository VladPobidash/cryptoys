import 'package:crypto_coins_list/repositories/crypto/models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<Coin>> getCoins();
  Future<Coin> getCoinInfo(String currencyCode);
}