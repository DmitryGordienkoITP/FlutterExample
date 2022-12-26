import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/data/dataproviders/api/photo_provider.dart';
import 'package:test_task/data/repositories/photo_repository.dart';

void main() {
  group('UnitTests', () {
    test('providersTest', () async {
      final photosProvider = PhotoProvider();

      final data = await photosProvider.getAll();
      expect(data.isNotEmpty, true);
    });

    test('repositoryTest', () async {
      final photosProvider = PhotoProvider();
      final photosRepository = PhotoRepository(photosProvider);

      final data = await photosRepository.get();
      expect(data.isNotEmpty, true);
    });
  });
}
