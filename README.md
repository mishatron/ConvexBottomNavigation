# convex_bottom_navigation

Bottom navigation with convex items

## How to use

```
ConvexBottomNavigation fn = ConvexBottomNavigation(
      tabs: [
        TabData(icon: Icon(Icons.home), title: "Home"),
        TabData(icon: Icon(Icons.menu), title: "Menu")
      ],
      onTabChangedListener: (position) {},
    );
```
Or, for example:
```
ConvexBottomNavigation(
      activeIconColor: colorPrimaryDark,
      inactiveIconColor: Colors.grey,
      textColor: colorPrimaryDark,
      circleSize: CircleSize.BIG,
      bigIconPadding: 10.0,
      tabs: [
        TabData(
            icon: Image(
              image: AssetImage("assets/ic_speaker.png"),
            ),
            title: "Feed"),
        TabData(
            icon: Image(
              image: AssetImage("assets/ic_profile.png"),
            ),
            title: "Profile")
      ],
      onTabChangedListener: (position) {
        setState(() {
          _currentIndex = position;
        });
      },
    );
```
See documentation to get information about all parameters

### Screenshots

![](https://raw.githubusercontent.com/mishatron/ConvexBottomNavigation/master/assets/screenshot1.gif)
