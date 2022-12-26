import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:test_task/dependencies/dependencies.dart';

import 'package:test_task/main.dart';
import 'package:test_task/presentation/screens/widgets/photos_list_item.dart';

void main() {
  group('widgets', () {
    configureDependencies();
    testWidgets('widgets test', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(MyApp());

        expect(find.text('Photos'), findsOneWidget);

        // wait for data
        await tester.pump(const Duration(seconds: 3));
        expect(find.byType(PhotosListItem), findsAtLeastNWidgets(1));

        await tester.tap(find.byType(PhotosListItem).first);
        await tester.pumpAndSettle();

        expect(find.text('Photos'), findsNothing);
        expect(find.text('Details'), findsOneWidget);

        // simulate a back button pressed
        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        await widgetsAppState.didPopRoute();
        await tester.pumpAndSettle();

        expect(find.text('Details'), findsNothing);
        expect(find.text('Photos'), findsOneWidget);
      });
    });
  });
}
