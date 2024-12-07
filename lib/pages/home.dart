import 'package:flutter/material.dart';

import '../main.dart';
import '../logo.dart';

class HomePageJO extends StatefulWidget {
  const HomePageJO({super.key});

  @override
  State<HomePageJO> createState() => _HomePageJOState();
}

class _HomePageJOState extends State<HomePageJO> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              (MediaQuery.sizeOf(context).width < mobileSizeJO.width) ? 75 : 0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height - 50,
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: false,
          trackVisibility: false,
          child: GridView.builder(
            controller: _scrollController,
            physics: StepScrollPhysics(
              step: MediaQuery.sizeOf(context).height - 50,
              isPages: true,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  (MediaQuery.sizeOf(context).width < mobileSizeJO.width + 200)
                      ? 1
                      : 2,
              mainAxisExtent: MediaQuery.sizeOf(context).height - 50,
            ),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return (index == 0)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectableText.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.fontFamily,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            children: [
                              const TextSpan(text: 'Youssef is a '),
                              TextSpan(
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                text: 'flutter developer',
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                text: 'back-end developer',
                              ),
                            ],
                          ),
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          textAlign: TextAlign.justify,
                        ),
                        const Column(
                          children: [
                            QoutedBoxJO(
                              text:
                                  'jjdfkdkjndkjdnkjdndjkndkjdn dkjndknd kjdnkhghkgjhgjhgjjhdkjndkjdn jkfdnfdkjdnk jjdfkdkjndkjdnkjdndjkndkjdn dkjndknd kjdnkhghkgjhgjhgjjhdkjndkjdn jkfdnfdkjdnk jjdfkdkjndkjdnkjdndjkndkjdn dkjndknd kjdnkhghkgjhgjhgjjhdkjndkjdn jkfdnfdkjdnk jjdfkdkjndkjdnkjdndjkndkjdn dkjndknd kjdnkhghkgjhgjhgjjhdkjndkjdn jkfdnfdkjdnk jjdfkdkjndkjdnkjdndjkndkjdn dkjndknd kjdnkhghkgjhgjhgjjhdkjndkjdn jkfdnfdkjdnk jjdfkdkjndkjdnkjdndjkndkjdn dkjndknd kjdnkhghkgjhgjhgjjhdkjndkjdn jkfdnfdkjdnk',
                              author: 'Youssef',
                            ),
                          ],
                        ),
                      ],
                    )
                  : const ProfileJO();
            },
          ),
        ),
      ),
    );
  }
}

class QoutedBoxJO extends StatelessWidget {
  const QoutedBoxJO({
    super.key,
    required this.text,
    required this.author,
  });

  final String text, author;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: (MediaQuery.sizeOf(context).height <
                                mobileSizeJO.height)
                            ? 40
                            : 80),
                    child: SingleChildScrollView(
                      physics: const StepScrollPhysics(),
                      child: Builder(
                        builder: (context) {
                          return SelectableText.rich(
                            textAlign: TextAlign.justify,
                            TextSpan(text: text),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 0.5,
                    ),
                    right: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 0.5,
                    ),
                    left: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          text: '> ',
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          text: author,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: const RotatedBox(
              quarterTurns: 2,
              child: Icon(
                size: 30,
                Icons.format_quote,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: const Icon(
              size: 30,
              Icons.format_quote,
            ),
          ),
        ),
      ],
    );
  }
}

class StepScrollPhysics extends ScrollPhysics {
  const StepScrollPhysics({
    super.parent,
    this.step = 20,
    this.isPages = false,
  });

  final double step;
  final bool isPages;

  // @override
  // ScrollPhysics applyTo(ScrollPhysics? ancestor) {
  //   return StepScrollPhysics(
  //     parent: buildParent(parent),
  //     step: step,
  //     isPages: isPages,
  //   );
  // }

  // @override
  // double applyBoundaryConditions(ScrollMetrics position, double value) {
  //   if (value < position.minScrollExtent) {
  //     return value;
  //   } else if (value > position.maxScrollExtent) {
  //     return value - position.maxScrollExtent;
  //   } else {
  //     return 0;
  //   }
  // }

  // @override
  // double adjustPositionForNewDimensions({
  //   required ScrollMetrics oldPosition,
  //   required ScrollMetrics newPosition,
  //   required bool isScrolling,
  //   required double velocity,
  // }) {
  //   if (newPosition.pixels < newPosition.minScrollExtent) {
  //     return newPosition.minScrollExtent;
  //   } else if (newPosition.pixels > newPosition.maxScrollExtent) {
  //     return newPosition.maxScrollExtent;
  //   } else {
  //     return newPosition.pixels;
  //   }
  // }

  // @override
  // Simulation? createBallisticSimulation(
  //   ScrollMetrics position,
  //   double velocity,
  // ) {
  //   double newPixels = position.pixels;

  //   if (velocity.isNegative) {
  //     newPixels = (position.pixels * 2) - ((position.pixels * 2) % step);
  //   }

  //   Simulation simulation = ScrollSpringSimulation(
  //     spring,
  //     position.pixels,
  //     newPixels,
  //     velocity,
  //     tolerance: toleranceFor(position),
  //   );
  //   return (isPages)
  //       ? simulation
  //       : super.createBallisticSimulation(
  //           position,
  //           velocity,
  //         );
  // }
}

// class JOSimulation extends Simulation {
//   @override
//   double dx(double time) {
//     throw UnimplementedError();
//   }

//   @override
//   bool isDone(double time) {
//     throw UnimplementedError();
//   }

//   @override
//   double x(double time) {
//     throw UnimplementedError();
//   }
// }

class ProfileJO extends StatelessWidget {
  const ProfileJO({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (MediaQuery.sizeOf(context).width < mobileSizeJO.width + 200)
          ? Alignment.center
          : Alignment.centerRight,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            child: CustomPaint(
              size: const Size(200, 160),
              painter: JOPainter(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Image(image: AssetImage('assets/profile/JO.png')),
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.5),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 7.5),
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const Text('data'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
