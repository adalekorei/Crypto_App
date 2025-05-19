import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoinModel coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      trailing: Icon(Icons.arrow_forward_ios),
      leading: Image.network(coin.imageUrl, height: 45, width: 45),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        '${coin.priceInUsd.toStringAsFixed(2)} \$',
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}
