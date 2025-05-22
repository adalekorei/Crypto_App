import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'models/crypto_coin_details_model.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio, required this.cryptoCoinsBox});

  final Dio dio;
  final Box<CryptoCoinModel> cryptoCoinsBox;

  @override
  Future<List<CryptoCoinModel>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoinModel>[];
    try {
      cryptoCoinsList = await _fetchCoinsListFromApi();

      final cryptoCoinsMap = {for (var e in cryptoCoinsList) e.name: e};
      await cryptoCoinsBox.putAll(cryptoCoinsMap);
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      cryptoCoinsList = cryptoCoinsBox.values.toList();
    }
    cryptoCoinsList.sort(
      (a, b) => b.details.priceInUsd.compareTo(a.details.priceInUsd),
    );
    return cryptoCoinsList;
  }

  Future<List<CryptoCoinModel>> _fetchCoinsListFromApi() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,ADA,TRX,SUI,LTC,LINK,AVAX,XMR,DOGE,XRP,VTC,LSK,PPC,QRK,NMC,SUI,XLM,HBAR,LEO,TON,DOT,BGB,DAI,AAVE,UNI,TAO,NEAR,APT,OKB,ONDO,KAS,CRO,ICP,GT,TKX,LION,MNT,POL,RENDER,VET,ENA,FTN,ALGO,ARB&tsyms=USD',
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList =
        dataRaw.entries.map((e) {
          final usdData =
              (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          final details = CryptoCoinDetailsModel.fromJson(usdData);
          return CryptoCoinModel(name: e.key, details: details);
        }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoinModel> getCoinDetails(String currencyCode) async {
    try {
      final coin = await _fetchCoinDetailsFromApi(currencyCode);
      cryptoCoinsBox.put(currencyCode, coin);
      return coin;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return cryptoCoinsBox.get(currencyCode)!;
    }
  }

  Future<CryptoCoinModel> _fetchCoinDetailsFromApi(String currencyCode) async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetailsModel.fromJson(usdData);

    return CryptoCoinModel(name: currencyCode, details: details);
  }
}
