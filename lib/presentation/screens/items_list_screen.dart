import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/business_logic/cubit/photos_cubit.dart';

import 'widgets/photos_list_item.dart';

class ItemsListScreen extends StatelessWidget {
  static String routeName = '/';
  const ItemsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: BlocBuilder<PhotosCubit, PhotosState>(
        builder: (context, state) {
          return Center(
            child: state.isLoading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: state.photos.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(5),
                      child: PhotosListItem(state.photos[index]),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
