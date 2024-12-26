import 'package:flutter/material.dart';

import '../main.dart';

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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              (MediaQuery.sizeOf(context).width < mobileSizeJO.width) ? 75 : 0,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('© Copyright 2022. Powered by '),
                TextIconButtonJO(
                  icon: Icons.abc,
                  label: 'Youssef',
                  only: TextIconButtonOnlyJO.textOnly,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
