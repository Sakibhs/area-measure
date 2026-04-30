import 'package:area_and_plot/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AreaAndPlotApp());
    expect(find.byType(AreaAndPlotApp), findsOneWidget);
  });
}
