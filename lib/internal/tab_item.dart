import 'package:flutter/material.dart';

const double ICON_OFF = 0;
const double ICON_ON = 0;
const double TEXT_OFF = 3;
const double TEXT_ON = 1;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 300;

/// Class TabItem represents ConvexBottomNavigation menu item
class TabItem extends StatelessWidget {
  /// Constructor
  /// All parameters becomes from ConvexBottomNavigation class
  TabItem(
      {@required this.uniqueKey,
      @required this.selected,
      @required this.icon,
      @required this.title,
      @required this.callbackFunction,
      @required this.textColor,
      @required this.activeIconColor,
      @required this.inactiveIconColor,
      this.iconPadding});

  final UniqueKey uniqueKey;
  final String title;
  final Widget icon;
  final bool selected;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final Color textColor;
  final Color activeIconColor;
  final Color inactiveIconColor;

  final double iconPadding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
                duration: const Duration(milliseconds: ANIM_DURATION),
                alignment: Alignment(0, (selected) ? TEXT_ON : TEXT_OFF),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: textColor),
                  ),
                )),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: ANIM_DURATION),
              curve: Curves.easeIn,
              alignment: Alignment(0, (selected) ? ICON_OFF : ICON_ON),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: ANIM_DURATION),
                opacity: (selected) ? ALPHA_OFF : ALPHA_ON,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.topCenter,
                  icon: Padding(
                    padding: EdgeInsets.all(iconPadding),
                    child: getIcon(),
                  ),
                  onPressed: () {
                    callbackFunction(uniqueKey);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Method, used to get correct icon
  /// It sets [activeIconColor] or [inactiveIconColor] if you use [Icon] or [Image]
  /// Otherwise it will return your widget
  Widget getIcon() {
    Color getColor() {
      if (selected) return activeIconColor;
      return inactiveIconColor;
    }

    if (icon is Icon) {
      var icon2 = Icon(
        (icon as Icon).icon,
        color: getColor(),
      );
      return icon2;
    } else if (icon is Image) {
      var icon2 = Image(
        image: (icon as Image).image,
        color: getColor(),
      );
      return icon2;
    }
    return icon;
  }
}
