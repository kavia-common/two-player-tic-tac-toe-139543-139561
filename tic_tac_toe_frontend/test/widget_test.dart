import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('App renders Tic Tac Toe with grid and reset button', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Title
    expect(find.text('Tic Tac Toe'), findsOneWidget);

    // Grid should have 9 tappable cells
    expect(find.byType(InkWell), findsNWidgets(9));

    // Status text starts with Player X's turn
    expect(find.textContaining("Player X's turn"), findsOneWidget);

    // Reset/New Game button present
    expect(find.widgetWithText(FilledButton, 'Reset'), findsOneWidget);
  });

  testWidgets('Tapping alternates turns and places marks', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Tap first cell -> X
    await tester.tap(find.byType(InkWell).at(0));
    await tester.pumpAndSettle();
    expect(find.text('X'), findsOneWidget);
    expect(find.textContaining("Player O's turn"), findsOneWidget);

    // Tap second cell -> O
    await tester.tap(find.byType(InkWell).at(1));
    await tester.pumpAndSettle();
    expect(find.text('O'), findsOneWidget);
    expect(find.textContaining("Player X's turn"), findsOneWidget);
  });
}
