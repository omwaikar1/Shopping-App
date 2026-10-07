import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/main.dart';

Future<void> pumpApp(WidgetTester tester) async {
  // Tall viewport so every product card is built by the lazy ListView.
  tester.view.physicalSize = const Size(1080, 4000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(const MyApp());
}

void main() {
  testWidgets('home page lists every product', (tester) async {
    await pumpApp(tester);

    expect(find.text('Men\'s Nike Shoes'), findsOneWidget);
    expect(find.text('Adidas Shoes'), findsOneWidget);
    expect(find.text('Bata Women\'s Shoes'), findsOneWidget);
    expect(find.text('Jordan Shoes'), findsOneWidget);
  });

  testWidgets('brand filter shows only that brand', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.widgetWithText(Chip, 'Nike'));
    await tester.pump();

    expect(find.text('Men\'s Nike Shoes'), findsOneWidget);
    expect(find.text('Jordan Shoes'), findsOneWidget);
    expect(find.text('Adidas Shoes'), findsNothing);
    expect(find.text('Bata Women\'s Shoes'), findsNothing);
  });

  testWidgets('search filters products by title', (tester) async {
    await pumpApp(tester);

    await tester.enterText(find.byType(TextField), 'adidas');
    await tester.pump();

    expect(find.text('Adidas Shoes'), findsOneWidget);
    expect(find.text('Men\'s Nike Shoes'), findsNothing);
    expect(find.text('Jordan Shoes'), findsNothing);
  });

  testWidgets('adding to cart requires a size, then shows in the cart', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Adidas Shoes'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add to cart'));
    await tester.pump();
    expect(find.text('Please select a size'), findsOneWidget);

    await tester.tap(find.widgetWithText(Chip, '10'));
    await tester.pump();
    await tester.tap(find.text('Add to cart'));
    await tester.pump();
    expect(find.text('Product added successfully'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('Size 10'), findsOneWidget);
  });
}
