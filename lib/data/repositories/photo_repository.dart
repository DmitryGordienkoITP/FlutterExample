import 'package:injectable/injectable.dart';
import 'package:test_task/data/models/photo_model.dart';

import '../dataproviders/api/photo_provider.dart';

@singleton
class PhotoRepository {
  final PhotoProvider _provider;
  PhotoRepository(this._provider);

  Future<List<PhotoModel>> get() async {
    return await _provider.getAll();
  }
}
