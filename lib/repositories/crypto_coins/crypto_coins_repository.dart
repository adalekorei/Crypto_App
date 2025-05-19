import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  const CryptoCoinsRepository({required this.dio});

final Dio dio;

  @override
  Future<List<CryptoCoinModel>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,ADA,TRX,SUI,LTC,LINK,AVAX,XMR,DOGE,XRP,VTC,LSK,PPC,QRK,NMC&tsyms=USD',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList =
        dataRaw.entries.map((e) {
          final usdData =
              (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          final price = usdData['PRICE'];
          final imageUrl = usdData['IMAGEURL'];
          return CryptoCoinModel(
            name: e.key,
            priceInUsd: price,
            imageUrl: 'https://www.cryptocompare.com/$imageUrl',
          );
        }).toList();
    return cryptoCoinsList;
  }
}
