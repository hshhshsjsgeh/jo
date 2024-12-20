import 'package:flutter/material.dart';

// pages
import 'package:jo/pages/home.dart';
import 'package:jo/pages/works.dart';

import './pages/app_bar.dart';

part './theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: theme,
    home: SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: JOFloatingActionButtonLocation.leftTop,
        floatingActionButton: JOFloatingActionButton(icons: socialIconsJO),
        appBar: const AppBarJO(
          preferredSize: Size(5, 50),
          child: Text('JO header'),
        ),
        body: const MyAppJO(),
      ),
    ),
  ));
}

class MyAppJO extends StatelessWidget {
  const MyAppJO({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  (MediaQuery.sizeOf(context).width < mobileSizeJO.width)
                      ? 0
                      : 75),
          child: const Column(
            children: [
              HomePageJO(),
              LineSeparatorPagesJO('works'),
              WorksPageJO(),
              LineSeparatorPagesJO('about me'),
              LineSeparatorPagesJO('contact me'),
            ],
          ),
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
              (MediaQuery.sizeOf(context).width < mobileSizeJO.width) ? 75 : 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 30,
                  fontFamily:
                      Theme.of(context).textTheme.labelLarge?.fontFamily,
                ),
                children: [
                  TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    text: '# ',
                  ),
                  TextSpan(text: widget.text),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomPaint(
                  size: const Size(1, 1),
                  painter: LineSeparatorJOPainter(),
                ),
              ),
            ),
            TextButton(
              onHover: colorToggle,
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'View all',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_right_alt_sharp,
                    color: color,
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
