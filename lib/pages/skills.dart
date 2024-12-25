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
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          SkillProgressJO(
            jop: 'Front-end Developer',
            framework: 'Flutter',
            languages: ['Dart'],
            progress: 90,
          ),
          SkillProgressJO(
            jop: 'Back-end Developer',
            framework: 'Nodejs',
            languages: ['JavaScript'],
            progress: 10,
          ),
          SkillProgressJO(
            jop: 'Back-end Developer',
            framework: 'Django',
            languages: ['Python'],
            progress: 85,
          ),
          SkillProgressJO(
            jop: 'Back-end Developer',
            framework: 'Back-end',
            languages: ['PHP'],
            progress: 62,
          ),
          SkillProgressJO(
            jop: 'Front-end Developer',
            framework: 'Front-end',
            languages: ['HTML', 'CSS', 'JavaScript'],
            progress: 60,
          ),
        ],
      ),
    );
  }
}

class SkillProgressJO extends StatelessWidget {
  const SkillProgressJO({
    super.key,
    required this.jop,
    required this.framework,
    required this.languages,
    this.progress = 0,
  });

  final String jop, framework;
  final List<String> languages;
  final double progress;

  @override
  Widget build(BuildContext context) {
    double width = 250;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 250,
          child: Text(
            '$jop | $framework (${languages.join(', ')})',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        SizedBox(height: 10),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondary,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              width: width,
              child: Text(
                '${progress.round()}%',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ClipRect(
              clipper: SkillProgressJOClipper(progress),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                width: width,
                child: Text(
                  '${progress.round()}%',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SkillProgressJOClipper extends CustomClipper<Rect> {
  const SkillProgressJOClipper(this.progress);

  final double progress;

  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width * (progress / 100), size.height);

    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}
