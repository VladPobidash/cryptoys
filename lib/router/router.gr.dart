// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CoinsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CoinsScreen(),
      );
    },
    CoinRoute.name: (routeData) {
      final args = routeData.argsAs<CoinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CoinScreen(
          key: args.key,
          coin: args.coin,
        ),
      );
    },
  };
}

/// generated route for
/// [CoinsScreen]
class CoinsRoute extends PageRouteInfo<void> {
  const CoinsRoute({List<PageRouteInfo>? children})
      : super(
          CoinsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoinsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CoinScreen]
class CoinRoute extends PageRouteInfo<CoinRouteArgs> {
  CoinRoute({
    Key? key,
    required Coin coin,
    List<PageRouteInfo>? children,
  }) : super(
          CoinRoute.name,
          args: CoinRouteArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinRoute';

  static const PageInfo<CoinRouteArgs> page = PageInfo<CoinRouteArgs>(name);
}

class CoinRouteArgs {
  const CoinRouteArgs({
    this.key,
    required this.coin,
  });

  final Key? key;

  final Coin coin;

  @override
  String toString() {
    return 'CoinRouteArgs{key: $key, coin: $coin}';
  }
}
