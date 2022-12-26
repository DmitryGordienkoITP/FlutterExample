// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/business_logic/cubit/photos_cubit.dart';
import 'package:test_task/data/dataproviders/api/photo_provider.dart';
import 'package:test_task/data/repositories/photo_repository.dart';

void main() {
  group('PhotosCubit', () {
    test('cubitTest', () async {
      final photosProvider = PhotoProvider();
      final photosRepository = PhotoRepository(photosProvider);
      PhotosCubit photosCubit;

      photosCubit = PhotosCubit(photosRepository);

      final initialState = PhotosState(isLoading: false, photos: []);
      expect(photosCubit.state.isLoading, initialState.isLoading);
      expect(photosCubit.state.photos.length, 0);

      final future = photosCubit.fetch();
      expect(photosCubit.state.isLoading, true);
      await future;
      expect(photosCubit.state.isLoading, false);

      expect(photosCubit.state.photos.isNotEmpty, true);

      photosCubit.close();
    });
  });
}
