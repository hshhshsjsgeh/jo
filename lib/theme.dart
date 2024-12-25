part of './main.dart';

final ThemeData theme = ThemeData(
  visualDensity: VisualDensity(horizontal: 1, vertical: 1),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(
      size: 20,
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'firacode',
    ),
    toolbarTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'firacode',
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFF707070),
  ),
  iconTheme: const IconThemeData(
    size: 20,
    color: Color(0x77707070),
  ),
  fontFamily: 'firacode',
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF707070),
    onPrimary: Color(0xFFFF0000),
    secondary: Colors.white,
    onSecondary: Color(0xFFFF0000),
    error: Color(0xFFFF0000),
    onError: Color(0xFFFF0000),
    surface: Color(0x77707070),
    onSurface: Color(0xFF707070),
  ),
  textSelectionTheme:
      const TextSelectionThemeData(selectionColor: Color(0x77707070)),
  primaryColor: const Color(0x77707070),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(Colors.white),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(LinearBorder.none),
      padding: WidgetStatePropertyAll(EdgeInsets.only(left: 50)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(Colors.white),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(LinearBorder.none),
      side: WidgetStatePropertyAll<BorderSide>(BorderSide(width: 0)),
      padding: WidgetStatePropertyAll(EdgeInsets.zero),
      animationDuration: Duration.zero,
      minimumSize: WidgetStatePropertyAll<Size>(Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: WidgetStatePropertyAll<MouseCursor>(MouseCursor.defer),
    ),
  ),
);

const Size mobileSizeJO = Size(760, 430);
