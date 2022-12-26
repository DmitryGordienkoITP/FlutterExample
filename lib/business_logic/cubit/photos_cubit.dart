import 'package:bloc/bloc.dart';
import 'package:test_task/data/models/photo_model.dart';
import 'package:test_task/data/repositories/photo_repository.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  final PhotoRepository _rep;
  PhotosCubit(this._rep) : super(PhotosState(isLoading: false, photos: []));

  Future<void> fetch() async {
    emit(PhotosState(isLoading: true, photos: state.photos));
    final result = await _rep.get();
    emit(PhotosState(isLoading: false, photos: result));
  }
}
