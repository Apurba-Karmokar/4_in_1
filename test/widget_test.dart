import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_4_in_1/main.dart'; // Replace with your app's import

void main() {
  testWidgets('App navigation and theme toggle test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify the initial page is the Weather page
    expect(find.text('Weather Page'), findsOneWidget);
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);

    // Verify navigation to Quizzer page
    await tester.tap(find.byIcon(Icons.quiz));
    await tester.pump();
    expect(find.text('Quizzer Page'), findsOneWidget);

    // Verify navigation to Calculator page
    await tester.tap(find.byIcon(Icons.calculate));
    await tester.pump();
    expect(find.text('Calculator Page'), findsOneWidget);

    // Verify navigation to About Me page
    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();
    expect(find.text('About Me Page'), findsOneWidget);

    // Verify theme toggle functionality
    await tester.tap(find.byIcon(Icons.nights_stay));
    await tester.pump();
    expect(
        find.byIcon(Icons.wb_sunny), findsOneWidget); // Theme changed to dark

    await tester.tap(find.byIcon(Icons.wb_sunny));
    await tester.pump();
    expect(find.byIcon(Icons.nights_stay),
        findsOneWidget); // Theme changed to light
  });
}
