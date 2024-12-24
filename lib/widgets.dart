part of './main.dart';

class _TextIconButtonJO extends TextIconButtonJO {
  const _TextIconButtonJO({
    super.key,
    required super.icon,
    required super.label,
    required super.reversed,
    super.onPressed,
    super.activated,
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
      activated: activated,
      onPressed: onPressed,
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
  });

  final IconData icon;
  final String label;
  final bool reversed, activated;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextIconButtonWidgetJO(
      reversed: reversed,
      icon: icon,
      label: label,
      activated: activated,
      onPressed: onPressed,
    );
  }

  factory TextIconButtonJO.outlined({
    Key? key,
    required IconData icon,
    required String label,
    bool reversed = false,
    bool activated = false,
    Function()? onPressed,
  }) {
    return _TextIconButtonJO(
      key: key,
      icon: icon,
      label: label,
      reversed: reversed,
      activated: activated,
      onPressed: onPressed,
    );
  }

  factory TextIconButtonJO.filled({
    Key? key,
    required IconData icon,
    required String label,
    bool reversed = false,
    bool activated = false,
    Function()? onPressed,
  }) {
    return _TextIconButtonJO(
      key: key,
      icon: icon,
      label: label,
      reversed: reversed,
      filled: true,
      activated: activated,
      onPressed: onPressed,
    );
  }
}

enum TextIconButtonTypeJO { normal, filled, outlined }

class TextIconButtonWidgetJO extends StatefulWidget {
  const TextIconButtonWidgetJO({
    super.key,
    required this.reversed,
    required this.icon,
    required this.label,
    this.activated = false,
    this.type = TextIconButtonTypeJO.normal,
    this.onPressed,
  });

  final bool reversed, activated;
  final IconData icon;
  final String label;
  final TextIconButtonTypeJO type;
  final void Function()? onPressed;

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
              vertical: widget.type == TextIconButtonTypeJO.normal ? 0 : 2.5,
              horizontal: widget.type == TextIconButtonTypeJO.normal ? 0 : 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: (widget.reversed) ? TextDirection.rtl : null,
              children: [
                Icon(
                  widget.icon,
                  color: (widget.type == TextIconButtonTypeJO.outlined)
                      ? (hovered)
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary
                      : (widget.type == TextIconButtonTypeJO.filled)
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.onSecondary,
                ),
                Text(' '),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: (widget.type == TextIconButtonTypeJO.outlined)
                        ? (hovered)
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary
                        : (widget.type == TextIconButtonTypeJO.filled)
                            ? (hovered)
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).scaffoldBackgroundColor
                            : (hovered)
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
