part of 'photos_cubit.dart';
/*
@immutable
abstract class PhotosState {}

class PhotosInitial extends PhotosState {}
*/

class PhotosState {
  bool isLoading = false;
  List<PhotoModel> photos;
  PhotosState({required this.isLoading, required this.photos});
  PhotoModel getById(int id) {
    return photos.firstWhere((element) => element.id == id);
  }
}
