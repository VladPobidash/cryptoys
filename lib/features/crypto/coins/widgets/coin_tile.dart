import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/repositories/crypto/models/coin.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:flutter/material.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({
    super.key,
    required this.coin,
  });

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinInfo = coin.info;

    return ListTile(
      leading: Image.network(coinInfo.fullImageUrl),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coinInfo.priceInUSD} \$', style: theme.textTheme.labelSmall),
      trailing: const  Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => {
        AutoRouter.of(context).push(CoinRoute(coin: coin))
      },
    );
  }
}