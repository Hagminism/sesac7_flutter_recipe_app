import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful_widget/presentation/component/unclicked_filter_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UnclickedFilterButton renders correctly', (tester) async {
    // given
    final testText = 'button';
    final testIsSelected = false;

    await tester.pumpWidget(
      MaterialApp(
        home: UnclickedFilterButton(text: testText, isSelected: testIsSelected),
      ),
    );

    // then
    expect(find.byType(UnclickedFilterButton), findsOneWidget);
    expect(find.text(testText), findsOneWidget);
  });
}
