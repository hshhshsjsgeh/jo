part of './main.dart';

class _TextIconButtonJO extends TextIconButtonJO {
  const _TextIconButtonJO({
    super.key,
    required super.icon,
    required super.label,
    required super.reversed,
    required super.only,
    super.onPressed,
    super.activated,
    super.iconSize,
    super.textSize,
    this.filled = false,
  });

  final bool filled;

  @override
  Widget build(BuildContext context) {
    TextIconButtonTypeJO type =
        (filled) ? TextIconButtonTypeJO.filled : TextIconButtonTypeJO.outlined;
    return TextIconButtonWidgetJO(
      reversed: reversed,
      icon: icon,
      label: label,
      type: type,
      only: only,
      activated: activated,
      onPressed: onPressed,
      iconSize: iconSize,
      textSize: textSize,
    );
  }
}

class TextIconButtonJO extends StatelessWidget {
  const TextIconButtonJO({
    super.key,
    required this.icon,
    required this.label,
    this.reversed = false,
    this.activated = false,
    this.onPressed,
    this.only = TextIconButtonOnlyJO.normal,
    this.iconSize,
    this.textSize,
  });

  final IconData icon;
  final String label;
  final bool reversed, activated;
  final void Function()? onPressed;
  final TextIconButtonOnlyJO only;
  final double? iconSize, textSize;

  @override
  Widget build(BuildContext context) {
    return TextIconButtonWidgetJO(
      reversed: reversed,
      icon: icon,
      label: label,
      only: only,
      activated: activated,
      onPressed: onPressed,
      iconSize: iconSize,
      textSize: textSize,
    );
  }

  factory TextIconButtonJO.outlined({
    Key? key,
    required IconData icon,
    required String label,
    TextIconButtonOnlyJO only = TextIconButtonOnlyJO.normal,
    bool reversed = false,
    bool activated = false,
    Function()? onPressed,
    double? iconSize,
    double? textSize,
  }) {
    return _TextIconButtonJO(
      key: key,
      icon: icon,
      label: label,
      only: only,
      reversed: reversed,
      activated: activated,
      onPressed: onPressed,
      iconSize: iconSize,
      textSize: textSize,
    );
  }

  factory TextIconButtonJO.filled({
    Key? key,
    required IconData icon,
    required String label,
    TextIconButtonOnlyJO only = TextIconButtonOnlyJO.normal,
    bool reversed = false,
    bool activated = false,
    Function()? onPressed,
    double? iconSize,
    double? textSize,
  }) {
    return _TextIconButtonJO(
      key: key,
      icon: icon,
      label: label,
      only: only,
      reversed: reversed,
      filled: true,
      activated: activated,
      onPressed: onPressed,
      iconSize: iconSize,
      textSize: textSize,
    );
  }
}

enum TextIconButtonTypeJO { normal, filled, outlined }

enum TextIconButtonOnlyJO { normal, textOnly, iconOnly }

class TextIconButtonWidgetJO extends StatefulWidget {
  const TextIconButtonWidgetJO({
    super.key,
    required this.reversed,
    required this.icon,
    required this.label,
    required this.only,
    this.activated = false,
    this.type = TextIconButtonTypeJO.normal,
    this.onPressed,
    this.iconSize,
    this.textSize,
  });

  final bool reversed, activated;
  final IconData icon;
  final String label;
  final TextIconButtonTypeJO type;
  final void Function()? onPressed;
  final TextIconButtonOnlyJO only;
  final double? iconSize, textSize;

  @override
  State<TextIconButtonWidgetJO> createState() {
    return _TextIconButtonWidgetJOState();
  }
}

class _TextIconButtonWidgetJOState extends State<TextIconButtonWidgetJO> {
  late bool hovered;

  @override
  initState() {
    hovered = widget.activated;
    super.initState();
  }

  void onHover(bool value) {
    setState(() {
      hovered = (widget.activated) ? true : value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: (widget.type == TextIconButtonTypeJO.filled)
            ? Theme.of(context).colorScheme.onSecondary
            : null,
        border: (widget.type == TextIconButtonTypeJO.outlined)
            ? Border.all(
                color: (hovered)
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.primary,
                width: 1,
              )
            : (widget.type == TextIconButtonTypeJO.filled)
                ? Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: 1,
                  )
                : null,
      ),
      child: GestureDetector(
        onTapDown: (details) {
          onHover(true);
        },
        onTapCancel: () {
          onHover(false);
        },
        child: TextButton(
          onPressed: () {
            widget.onPressed!();
          },
          onHover: (value) {
            onHover(value);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.type == TextIconButtonTypeJO.normal ? 0 : 5,
              horizontal: widget.type == TextIconButtonTypeJO.normal ? 0 : 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: (widget.reversed) ? TextDirection.rtl : null,
              children: [
                ...(widget.only == TextIconButtonOnlyJO.normal ||
                        widget.only == TextIconButtonOnlyJO.iconOnly)
                    ? [
                        Icon(
                          widget.icon,
                          color: (widget.type == TextIconButtonTypeJO.outlined)
                              ? (hovered)
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.primary
                              : (widget.type == TextIconButtonTypeJO.filled)
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).colorScheme.onSecondary,
                          size: widget.iconSize,
                        ),
                      ]
                    : [],
                ...(widget.only == TextIconButtonOnlyJO.normal ||
                        widget.only == TextIconButtonOnlyJO.textOnly)
                    ? [
                        Text(' ', style: TextStyle(fontSize: widget.textSize)),
                        Text(
                          widget.label,
                          style: TextStyle(
                            color: (widget.type ==
                                    TextIconButtonTypeJO.outlined)
                                ? (hovered)
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.primary
                                : (widget.type == TextIconButtonTypeJO.filled)
                                    ? (hovered)
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .scaffoldBackgroundColor
                                    : (hovered)
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onSecondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                            fontSize: widget.textSize,
                          ),
                        ),
                      ]
                    : [],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
