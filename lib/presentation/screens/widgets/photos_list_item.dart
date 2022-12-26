import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';

import '../../../data/models/photo_model.dart';
import '../single_item_screen.dart';

class PhotosListItem extends StatelessWidget {
  const PhotosListItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  final PhotoModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => SingleItemScreen(itemId: item.id)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageThumb(item),
              Flexible(
                child: Text(item.title,
                    style: Theme.of(context).textTheme.bodyText2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageThumb extends StatelessWidget {
  PhotoModel item;
  ImageThumb(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: FadeInImage.assetNetwork(
        height: 150,
        width: 150,
        placeholderScale: 6,
        placeholder: circularProgressIndicator,
        image: item.thumbnailUrl,
      ),
    );
  }
}

class ImageDetails extends StatelessWidget {
  const ImageDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  final PhotoModel item;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Title: ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: item.title, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
