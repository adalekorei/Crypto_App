import 'package:crypto_app/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoinModel>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto App')),
      body:
          (_cryptoCoinsList == null)
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : ListView.separated(
                padding: EdgeInsets.only(top: 16),
                itemCount: _cryptoCoinsList!.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final coin = _cryptoCoinsList![index];
                  return CryptoCoinTile(coin: coin);
                },
              ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
