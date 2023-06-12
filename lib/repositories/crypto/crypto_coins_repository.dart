import 'package:crypto_coins_list/repositories/crypto/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CoinsRepository implements AbstractCoinsRepository {
  CoinsRepository({
    required this.dio,
    required this.coinsBox,
  });

  final Dio dio;
  final Box<Coin> coinsBox;

  @override
  Future<List<Coin>> getCoins() async {
    var coins = <Coin>[];

    try {
      coins = await _fetchCoinsFromAPI();
      await coinsBox.putAll({ for (var c in coins) c.name: c }); 
    } catch(e, st) {
      GetIt.I<Talker>().handle(e, st);
      coins = coinsBox.values.toList();
    }

    coins.sort((a, b) => b.info.priceInUSD.compareTo(a.info.priceInUSD));
    
    return coins;
  }

  Future<List<Coin>> _fetchCoinsFromAPI() async {
    final res = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD');
    final data = res.data['RAW'] as Map<String, dynamic>;
    
    return data.entries.map((e) {
      final info = CoinInfo.fromJson((e.value as Map<String, dynamic>)['USD']);
    
      return Coin(name: e.key, info: info);
    }).toList();
  }

  @override
  Future<Coin> getCoinInfo(String currencyCode) async {
    Coin coin;

    try {
      coin = await _fetchCoinInfoFromAPI(currencyCode);
      coinsBox.put(currencyCode, coin);
    } catch(e, st) {
      GetIt.I<Talker>().handle(e, st);
      coin = coinsBox.get(currencyCode)!;
    }
    
    return coin;
  }

  Future<Coin> _fetchCoinInfoFromAPI(String currencyCode) async {
    final res = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final info = CoinInfo.fromJson(res.data['RAW'][currencyCode]['USD']);

    return Coin(name: currencyCode, info: info);
  }
}
