import 'package:flutter/material.dart';

import '../main.dart';

class SkillsPageJO extends StatelessWidget {
  const SkillsPageJO({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              (MediaQuery.sizeOf(context).width < mobileSizeJO.width) ? 75 : 0),
      child: Text('skills'),
    );
  }
}
