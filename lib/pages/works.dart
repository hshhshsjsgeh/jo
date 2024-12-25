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
            images: [
              Image.network(
                  'https://images.template.net/wp-content/uploads/2024/12/Personal-Website-Templates.png'),
              Image.network(
                  'https://www.fotolip.com/wp-content/uploads/2016/05/Web-Templates-4.jpg'),
            ],
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
    required this.images,
    required this.languages,
    required this.title,
    required this.link,
    this.description = '',
  });

  final List<Image> images;
  final List<String> languages;
  final String title, description, link;

  @override
  State<JOWorkCard> createState() => _JOWorkCardState();
}

class _JOWorkCardState extends State<JOWorkCard> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150),
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    children: List.generate(
                      widget.images.length,
                      (index) {
                        return FittedBox(
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          child: widget.images[index],
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 2.5,
                        children: List.generate(
                          widget.images.length,
                          (index) {
                            return TextIconButtonJO(
                              onPressed: () {
                                _pageController.jumpToPage(index);
                              },
                              icon: Icons.square_sharp,
                              label: '',
                              iconSize: 10,
                              only: TextIconButtonOnlyJO.iconOnly,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
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
                  TextIconButtonJO.outlined(
                    icon: Icons.open_in_new,
                    label: 'Live',
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
