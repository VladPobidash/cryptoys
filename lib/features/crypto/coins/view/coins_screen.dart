import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto/coins/bloc/coins_block.dart';
import 'package:crypto_coins_list/features/crypto/coins/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class CoinsScreen extends StatefulWidget {
  const CoinsScreen({super.key});

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  final _coinsBloc = CoinsBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _coinsBloc.add(LoadCoins());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto currencies list'),
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
      body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _coinsBloc.add(LoadCoins(completer: completer));
            return completer.future;
          },
        child: BlocBuilder<CoinsBloc, CoinsState>(
          bloc: _coinsBloc,
          builder: (context, state) {
            if (state is CoinsLoaded) {
              return ListView.separated(
                itemCount: state.coins.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => CoinTile(coin: state.coins[index])
              );
            }
      
            if (state is CoinsLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.headlineMedium
                    ),
                    Text(
                      'Please try again later',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16)
                    ),
                    const SizedBox(height: 32),
                    TextButton(
                      onPressed: () {
                        _coinsBloc.add(LoadCoins());
                      }, 
                      child: const Text('Try again')
                    )
                  ],
                )
              );
            }
      
            return const Center(child: CircularProgressIndicator(color: Color(0xffdfe6e9)));
          },
        ),
      )
      
    );
  }
}
