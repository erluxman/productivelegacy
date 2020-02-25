import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productive/main.dart';
import 'package:productive/ui/home.dart';

void main() {
  testWidgets('Has BottomAppbar of CircularNotchedRectangle shape',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProductiveApp());

    expect(find.byType(BottomAppBar), findsOneWidget);

    expect(
      find.byWidgetPredicate(
          (Widget widget) =>
              widget is BottomAppBar &&
              widget.shape is CircularNotchedRectangle,
          description: 'BottomAppbar has CircularNotchedRectangle shape'),
      findsOneWidget,
    );
  });

  testWidgets('BottomAppbar contains 4 menus', (WidgetTester tester) async {
    await tester.pumpWidget(ProductiveApp());
    expect(find.byType(AppbarMenu), findsNWidgets(4));
  });

  _appbarMenuWithIconActive(IconData icon) {
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is AppbarMenu && widget.isActive && widget.icon == icon),
        findsOneWidget);
  }

  testWidgets(
    'AppbarMenuItem enables after  clicked',
    (WidgetTester tester) async {
      await tester.pumpWidget(ProductiveApp());
      _appbarMenuWithIconActive(Icons.home);
      await tester.tap(find.byIcon(Icons.pie_chart));
      await tester.pump();
      _appbarMenuWithIconActive(Icons.pie_chart);
    },
  );

  testWidgets('Contains a  center docked Fab with + icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProductiveApp());
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is Scaffold &&
            widget.floatingActionButtonLocation ==
                FloatingActionButtonLocation.centerDocked),
        findsOneWidget);

    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is FloatingActionButton && widget.elevation == 8.0,
          description: 'widget with tooltip "Back"',
        ),
        findsOneWidget);
  });
}
