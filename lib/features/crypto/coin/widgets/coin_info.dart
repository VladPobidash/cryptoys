import 'package:flutter/material.dart';

class CoinInfoWidget extends StatelessWidget {
  const CoinInfoWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff636e72),
      ),
      child: child,
    );
  }
}