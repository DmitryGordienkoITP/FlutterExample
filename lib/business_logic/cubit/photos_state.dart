part of 'photos_cubit.dart';

class PhotosState {
  bool isLoading = false;
  List<PhotoModel> photos;
  PhotosState({required this.isLoading, required this.photos});
  PhotoModel getById(int id) {
    return photos.firstWhere((element) => element.id == id);
  }
}
