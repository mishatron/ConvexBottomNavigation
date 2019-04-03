import 'package:convex_bottom_navigation/convex_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Creates mock app
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blueAccent,
            primaryColorDark: Colors.blue,
            brightness: Brightness.light),
        home: Scaffold(body: Center(), bottomNavigationBar: child));
  }

  /// This test checks if ConvexBottomNavigation has needed tabs and does not have another
  testWidgets('ConvexBottomNavigation has correct tabs',
      (WidgetTester tester) async {
    ConvexBottomNavigation fn = ConvexBottomNavigation(
      tabs: [
        TabData(icon: Icon(Icons.home), title: "Home"),
        TabData(icon: Icon(Icons.menu), title: "Menu")
      ],
      onTabChangedListener: (position) {},
    );

    await tester.pumpWidget(makeTestableWidget(child: fn));

    final homeFinder = find.text("Home");
    expect(homeFinder, findsOneWidget);

    final homeIconFinder = find.byIcon(Icons.home);
    expect(homeIconFinder, findsNWidgets(2));

    final menuIconFinder = find.byIcon(Icons.menu);
    expect(menuIconFinder, findsOneWidget);

    final menuFinder = find.text("Menu");
    expect(menuFinder, findsOneWidget);

    final randomFinder = find.text("Random");
    expect(randomFinder, findsNothing);
  });


  /// This test checks if ConvexBottomNavigation makes active item convex
  testWidgets('Clicking icon moves the circle', (WidgetTester tester) async {
    ConvexBottomNavigation fn = ConvexBottomNavigation(
      tabs: [
        TabData(icon: Icon(Icons.home), title: "Home"),
        TabData(icon: Icon(Icons.menu), title: "Menu")
      ],
      onTabChangedListener: (position) {},
    );

    await tester.pumpWidget(makeTestableWidget(child: fn));

    final homeFinder = find.text("Home");
    final homeIconFinder = find.byIcon(Icons.home);
    final menuIconFinder = find.byIcon(Icons.menu);
    final menuFinder = find.text("Menu");
    final randomFinder = find.text("Random");

    expect(homeFinder, findsOneWidget);
    expect(homeIconFinder, findsNWidgets(2));
    expect(menuIconFinder, findsOneWidget);
    expect(menuFinder, findsOneWidget);
    expect(randomFinder, findsNothing);

    await tester.tap(menuIconFinder);
    await tester.pumpAndSettle();

    expect(menuIconFinder, findsNWidgets(2));
    expect(homeIconFinder, findsOneWidget);
  });
}
