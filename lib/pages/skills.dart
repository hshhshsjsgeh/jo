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
      child: Column(
        children: [
          TextIconButtonJO(icon: Icons.crop_square, label: 'label'),
          TextIconButtonJO(
              icon: Icons.crop_square, label: 'label', activated: true),
          TextIconButtonJO.filled(icon: Icons.telegram, label: 'label'),
          TextIconButtonJO.filled(
              icon: Icons.telegram, label: 'label', activated: true),
          TextIconButtonJO.outlined(icon: Icons.telegram, label: 'label'),
          TextIconButtonJO.outlined(
            icon: Icons.telegram,
            label: 'label',
            activated: true,
          ),
          TextIconButtonJO(
              icon: Icons.telegram, label: 'label', reversed: true),
          TextIconButtonJO(
            icon: Icons.telegram,
            label: 'label',
            reversed: true,
            activated: true,
          ),
          TextIconButtonJO.filled(
              icon: Icons.telegram, label: 'label', reversed: true),
          TextIconButtonJO.filled(
            icon: Icons.telegram,
            label: 'label',
            reversed: true,
            activated: true,
          ),
          TextIconButtonJO.outlined(
              icon: Icons.telegram, label: 'label', reversed: true),
          TextIconButtonJO.outlined(
            icon: Icons.telegram,
            label: 'label',
            reversed: true,
            activated: true,
          ),
        ],
      ),
    );
  }
}
