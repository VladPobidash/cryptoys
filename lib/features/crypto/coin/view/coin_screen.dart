import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto/coin/bloc/coin_block.dart';
import 'package:crypto_coins_list/features/crypto/coin/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key, required this.coin});

  final Coin  coin;

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  final _coinInfoBloc = CoinBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _coinInfoBloc.add(LoadCoinInfo(currencyCode: widget.coin.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TalkerScreen(
                    talker: GetIt.I<Talker>(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.document_scanner_outlined))
        ],
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        bloc: _coinInfoBloc,
        builder: (context, state) {
          if (state is CoinInfoLoaded) {
            final coinInfo = state.coin.info;

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 192,
                    width: 192,
                    child: Image.network(coinInfo.fullImageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.coin.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CoinInfoWidget(
                    child: Center(
                      child: Text(
                        '${coinInfo.priceInUSD} \$',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  CoinInfoWidget(
                    child: Column(
                      children: [
                        _DataRow(
                          title: 'Hight 24 Hour',
                          value: '${coinInfo.hight24Hour} \$',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: 'Low 24 Hour',
                          value: '${coinInfo.low24Hours} \$',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator(color: Color(0xffdfe6e9)));
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
