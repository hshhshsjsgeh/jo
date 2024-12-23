import 'package:flutter/material.dart';

import '../main.dart';

class WorksPageJO extends StatelessWidget {
  const WorksPageJO({super.key});

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
          JOWorkCard(
            image: Image.network(
                'https://images.template.net/wp-content/uploads/2024/12/Personal-Website-Templates.png'),
            languages: ['Dart', 'Flutter'],
            title: 'Work 1',
            description: 'Description of work 1',
            link: '',
          ),
        ],
      ),
    );
  }
}

class JOWorkCard extends StatefulWidget {
  const JOWorkCard({
    super.key,
    required this.image,
    required this.languages,
    required this.title,
    required this.link,
    this.description = '',
  });

  final Image image;
  final List<String> languages;
  final String title, description, link;

  @override
  State<JOWorkCard> createState() => _JOWorkCardState();
}

class _JOWorkCardState extends State<JOWorkCard> {
  Color colorText = theme.colorScheme.primary;
  Color colorIcon = theme.colorScheme.primary;
  Color colorBorder = theme.colorScheme.primary;

  void colorToggle(bool toggled) {
    setState(() {
      colorText =
          (toggled) ? theme.colorScheme.secondary : theme.colorScheme.primary;
      colorIcon =
          (toggled) ? theme.colorScheme.onPrimary : theme.colorScheme.primary;
      colorBorder =
          (toggled) ? theme.colorScheme.onPrimary : theme.colorScheme.primary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.image,
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  for (final language in widget.languages) Text('$language '),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(widget.description),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTapDown: (details) {
                      colorToggle(true);
                    },
                    onTapCancel: () {
                      colorToggle(false);
                    },
                    child: TextButton.icon(
                      onPressed: () {},
                      onHover: colorToggle,
                      label: const Text('Live'),
                      icon: const Icon(Icons.open_in_new),
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll<Color>(
                          colorText,
                        ),
                        iconColor: WidgetStatePropertyAll<Color>(
                          colorIcon,
                        ),
                        shape: WidgetStatePropertyAll<OutlinedBorder>(
                          BeveledRectangleBorder(
                            side: BorderSide(
                              color: colorBorder,
                              width: 0.5,
                            ),
                          ),
                        ),
                        padding:
                            const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                          EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
