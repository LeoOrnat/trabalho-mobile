// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:example_application/main.dart';

void main() {
  testWidgets('Renderiza menu de atividades', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MainApp()));

    expect(find.text('Atividades Avaliativas'), findsOneWidget);
    expect(find.text('Trabalho 3 - Calculadora'), findsOneWidget);
    expect(find.text('Trabalho 4 - To-Do List'), findsOneWidget);
  });
}
