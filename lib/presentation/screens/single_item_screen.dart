// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_gifs/loading_gifs.dart';

import 'package:test_task/business_logic/cubit/photos_cubit.dart';

import '../../data/models/photo_model.dart';

class SingleItemScreen extends StatelessWidget {
  int itemId;
  SingleItemScreen({
    Key? key,
    required this.itemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey('SingleItemScreen'),
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<PhotosCubit, PhotosState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _ContentWidget(state.getById(itemId)),
            ),
          );
        },
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  PhotoModel item;
  _ContentWidget(this.item, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: FadeInImage.assetNetwork(
            image: item.url,
            placeholderScale: 6,
            placeholder: circularProgressIndicator,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(item.title, style: Theme.of(context).textTheme.headline6),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'Description: ',
                  style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: 'Lorem inpsum',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        )
      ],
    );
  }
}
