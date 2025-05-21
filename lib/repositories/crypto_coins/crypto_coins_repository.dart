import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

import 'models/crypto_coin_details_model.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoinModel>> getCoinsList() async {
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
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetailsModel.fromJson(usdData);

    return CryptoCoinModel(name: currencyCode, details: details);
  }
}
