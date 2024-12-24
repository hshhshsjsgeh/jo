import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../icons/jo_icons.dart';

List<TabActionAppBarJO> tabsActionAppBarJO = List.generate(
  pages.length,
  (index) => TabActionAppBarJO(
    pages[index],
    index: index,
    scrollController: scrollController,
  ),
);

final Map<IconData, String> socialIconsJO = {
  Icons.facebook: '',
  Icons.code: '',
};

class AppBarJO extends PreferredSize {
  const AppBarJO({
    super.key,
    required super.preferredSize,
    required super.child,
    required this.scrollController,
    this.isDialog = false,
  });

  final ScrollController scrollController;

  final bool isDialog;

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: EdgeInsets.only(
          left:
              (MediaQuery.sizeOf(context).width < mobileSizeJO.width) ? 0 : 50,
        ),
        child: AppBar(
          toolbarHeight: preferredSize.height,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          title: TitleAppBarJO(
            scrollController: scrollController,
            isDialog: isDialog,
          ),
          actions: (MediaQuery.sizeOf(context).width < mobileSizeJO.width ||
                  isDialog)
              ? [
                  MenuActionAppBarJO(
                    isDialog: isDialog,
                    scrollController: scrollController,
                  )
                ]
              : tabsActionAppBarJO,
        ),
      ),
    );
  }
}

class AppBarJOChangeNotifier with ChangeNotifier {
  bool _hovered = false, _clicked = false;
  bool get hovered => _hovered;
  bool get clicked => _clicked;

  void toggle(bool event) {
    _hovered = event;
    notifyListeners();
  }

  void click() {
    _clicked = !_clicked;
    notifyListeners();
  }
}

class TitleAppBarJO extends StatelessWidget {
  const TitleAppBarJO({
    super.key,
    required this.scrollController,
    this.isDialog = false,
  });

  final ScrollController scrollController;
  final bool isDialog;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppBarJOChangeNotifier(),
      builder: (context, child) {
        return Row(
          children: [
            GestureDetector(
              onTapDown: (details) {
                Provider.of<AppBarJOChangeNotifier>(context, listen: false)
                    .toggle(true);
              },
              onTapCancel: () {
                Provider.of<AppBarJOChangeNotifier>(context, listen: false)
                    .toggle(false);
              },
              child: TextButton.icon(
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: Durations.long2,
                    curve: Curves.easeInOut,
                  );
                  if (isDialog) {
                    Navigator.of(context).pop();
                  }
                },
                onHover: (value) {
                  Provider.of<AppBarJOChangeNotifier>(context, listen: false)
                      .toggle(value);
                },
                label: Text(' Protofolio'),
                icon: Consumer<AppBarJOChangeNotifier>(
                    builder: (context, value, child) {
                  return Icon(
                    JOIcons.jo,
                    color: (value.hovered)
                        ? const Color(0xFFFF0000)
                        : Colors.white,
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}

class TabActionAppBarJO extends StatelessWidget {
  const TabActionAppBarJO(
    this.text, {
    super.key,
    required this.index,
    required this.scrollController,
    this.isDialog = false,
  });

  final int index;
  final bool isDialog;
  final ScrollController scrollController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ChangeNotifierProvider(
        create: (context) => AppBarJOChangeNotifier(),
        builder: (context, child1) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              Provider.of<AppBarJOChangeNotifier>(
                context,
                listen: false,
              ).toggle(true);
            },
            onExit: (event) {
              Provider.of<AppBarJOChangeNotifier>(
                context,
                listen: false,
              ).toggle(false);
            },
            child: TextIconButtonJO(
              onPressed: () {
                scrollController.animateTo(
                  (pagesKeys[index].currentContext!.findRenderObject()
                              as RenderBox)
                          .localToGlobal(Offset.zero)
                          .dy +
                      scrollController.offset -
                      50,
                  duration: Durations.long2,
                  curve: Curves.easeInOut,
                );
                if (isDialog) {
                  Navigator.of(context).pop();
                }
              },
              icon: Icons.tag,
              label: text,
            ),
            // child: GestureDetector(
            //   onTap: () {
            //     // scroll
            //     scrollController.animateTo(
            //       (pagesKeys[index].currentContext!.findRenderObject()
            //                   as RenderBox)
            //               .localToGlobal(Offset.zero)
            //               .dy +
            //           scrollController.offset -
            //           50,
            //       duration: Durations.long2,
            //       curve: Curves.easeInOut,
            //     );
            //     if (isDialog) {
            //       Navigator.of(context).pop();
            //     }
            //   },
            //   child: Row(
            //     children: [
            //       const Text('# ', style: TextStyle(color: Color(0xFFFF0000))),
            //       Consumer<AppBarJOChangeNotifier>(
            //         builder: (context, value, child2) {
            //           return Text(
            //             child,
            //             style: TextStyle(
            //               color: (value.hovered)
            //                   ? const Color(0xFFFF0000)
            //                   : Colors.white,
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          );
        },
      ),
    );
  }
}

class MenuActionAppBarJO extends StatefulWidget {
  const MenuActionAppBarJO({
    super.key,
    required this.isDialog,
    required this.scrollController,
  });

  final ScrollController scrollController;

  final bool isDialog;

  @override
  State<MenuActionAppBarJO> createState() => _MenuActionAppBarJOState();
}

class _MenuActionAppBarJOState extends State<MenuActionAppBarJO> {
  bool _menuShowed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ChangeNotifierProvider(
        create: (context) => AppBarJOChangeNotifier(),
        builder: (context, child1) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              Provider.of<AppBarJOChangeNotifier>(
                context,
                listen: false,
              ).toggle(true);
            },
            onExit: (event) {
              Provider.of<AppBarJOChangeNotifier>(
                context,
                listen: false,
              ).toggle(false);
            },
            child: GestureDetector(
              onTap: () {
                if (!widget.isDialog) {
                  setState(() {
                    _menuShowed = true;
                  });
                }
                if (_menuShowed) {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog.fullscreen(
                      backgroundColor: Colors.black,
                      child: Column(
                        children: [
                          AppBarJO(
                            preferredSize: Size(5, 50),
                            isDialog: true,
                            scrollController: widget.scrollController,
                            child: Text('JO header'),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                pages.length,
                                (index) => TabActionAppBarJO(
                                  pages[index],
                                  index: index,
                                  scrollController: scrollController,
                                  isDialog: true,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(
                                  socialIconsJO.length,
                                  (index) => MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      child: Icon(
                                        size: 30,
                                        color: Theme.of(context)
                                            .floatingActionButtonTheme
                                            .foregroundColor,
                                        socialIconsJO.keys.toList()[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  setState(() {
                    _menuShowed = false;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Consumer<AppBarJOChangeNotifier>(
                builder: (context, value, child2) {
                  return Icon(
                    (widget.isDialog) ? Icons.close : Icons.menu_sharp,
                    color: (value.hovered || value.clicked || widget.isDialog)
                        ? const Color(0xFFFF0000)
                        : Colors.white,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class JOFloatingActionButtonLocation extends FloatingActionButtonLocation {
  const JOFloatingActionButtonLocation(this.x, this.y);

  final double x, y;

  static const JOFloatingActionButtonLocation leftTop =
      JOFloatingActionButtonLocation(0, 0);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    return Offset(x, y);
  }
}

class LineJOFloatingActionButtonCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..color = theme.floatingActionButtonTheme.foregroundColor!
      ..isAntiAlias = false;

    canvas.drawLine(Offset.zero, Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class JOFloatingActionButton extends StatelessWidget {
  const JOFloatingActionButton({
    super.key,
    required this.icons,
  });

  final Map<IconData, String> icons;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (MediaQuery.sizeOf(context).width < mobileSizeJO.width)
          ? false
          : true,
      child: SizedBox(
        width: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(1, 50),
              painter: LineJOFloatingActionButtonCustomPainter(),
            ),
            ...List.generate(
              icons.length,
              (index) => Padding(
                padding: const EdgeInsets.only(top: 5),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Icon(
                      color: Theme.of(context)
                          .floatingActionButtonTheme
                          .foregroundColor,
                      icons.keys.toList()[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
