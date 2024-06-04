import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nongkuy/screens/search/search_screen.dart';

void main() {
  testWidgets('Search screen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SearchScreen(),
    ));

    expect(find.text('Search Restaurant'), findsOneWidget);

    expect(find.byType(TextField), findsOneWidget);

    expect(find.byIcon(Icons.search), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsNothing);

    expect(find.text('Find your favorite restaurant here!'), findsOneWidget);

    expect(find.byType(ListView), findsNothing);

    expect(find.text('No restaurants found.'), findsNothing);

    expect(find.text('Error occurred. Please check your internet connection.'),
        findsNothing);
  });
}
