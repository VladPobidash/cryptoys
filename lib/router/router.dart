import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto/coin/view/view.dart';
import 'package:crypto_coins_list/features/crypto/coins/view/coins_screen.dart';
import 'package:crypto_coins_list/repositories/crypto/models/models.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';            
              
@AutoRouterConfig()      
class AppRouter extends _$AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [      
    AutoRoute(page: CoinsRoute.page, path: '/'),
    AutoRoute(page: CoinRoute.page),
  ];
}
