import 'package:flutter/material.dart';

class AppFooterJO extends StatelessWidget {
  const AppFooterJO({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 0.5,
          ),
        ),
      ),
      child: SizedBox(height: 200, width: MediaQuery.of(context).size.width),
    );
  }
}
