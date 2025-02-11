import 'package:flutter/material.dart';

// pages
import 'package:jo/pages/home.dart';
import 'package:jo/pages/works.dart';
import 'package:jo/pages/skills.dart';

import './pages/app_bar.dart';
import './pages/app_footer.dart';

part './theme.dart';
part './widgets.dart';

final ScrollController scrollController = ScrollController();

List<String> pages = ['works', 'skills', 'about me'];

List<GlobalKey> pagesKeys = List.generate(
  pages.length,
  (index) => GlobalKey(debugLabel: pages[index]),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: theme,
    home: SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: JOFloatingActionButtonLocation.leftTop,
        floatingActionButton: JOFloatingActionButton(icons: socialIconsJO),
        appBar: AppBarJO(
          preferredSize: Size(5, 50),
          scrollController: scrollController,
          child: Text('JO header'),
        ),
        body: MyAppJO(
          scrollController: scrollController,
        ),
      ),
    ),
  ));
}

class MyAppJO extends StatefulWidget {
  const MyAppJO({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<MyAppJO> createState() => _MyAppJOState();
}

class _MyAppJOState extends State<MyAppJO> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = widget.scrollController;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      (MediaQuery.sizeOf(context).width < mobileSizeJO.width)
                          ? 0
                          : 65),
              child: Column(
                children: [
                  HomePageJO(),
                  LineSeparatorPagesJO(key: pagesKeys[0], pages[0]),
                  WorksPageJO(),
                  LineSeparatorPagesJO(key: pagesKeys[1], pages[1]),
                  SkillsPageJO(),
                  LineSeparatorPagesJO(key: pagesKeys[2], pages[2]),
                ],
              ),
            ),
            const AppFooterJO(),
          ],
        ),
      ),
    );
  }
}

class LineSeparatorPagesJO extends StatefulWidget {
  const LineSeparatorPagesJO(
    this.text, {
    super.key,
  });

  final String text;

  @override
  State<LineSeparatorPagesJO> createState() => _LineSeparatorPagesJOState();
}

class _LineSeparatorPagesJOState extends State<LineSeparatorPagesJO> {
  Color color = theme.colorScheme.secondary;

  void colorToggle(bool toggled) {
    setState(() {
      color = (toggled)
          ? theme.colorScheme.onSecondary
          : theme.colorScheme.secondary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              (MediaQuery.sizeOf(context).width < mobileSizeJO.width) ? 65 : 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextIconButtonJO(
              icon: Icons.tag,
              label: widget.text,
              cursor: MouseCursor.defer,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomPaint(
                size: const Size(1, 1),
                painter: LineSeparatorJOPainter(),
              ),
            ),
            // TextButton(
            //   onHover: colorToggle,
            //   onPressed: () {},
            //   child: Row(
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(
            //           right: (MediaQuery.sizeOf(context).width <
            //                   mobileSizeJO.width)
            //               ? 0
            //               : 10,
            //           left: 20,
            //         ),
            //         child:
            //             (MediaQuery.sizeOf(context).width < mobileSizeJO.width)
            //                 ? const Text('')
            //                 : Text(
            //                     'View all',
            //                     style: TextStyle(
            //                       color: color,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //       ),
            //       Icon(
            //         Icons.arrow_right_alt_sharp,
            //         color: color,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class LineSeparatorJOPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = theme.colorScheme.onPrimary
      ..strokeWidth = 1
      ..isAntiAlias = false;
    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
