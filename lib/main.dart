import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/business_logic/cubit/photos_cubit.dart';
import 'package:test_task/data/repositories/photo_repository.dart';

import 'dependencies/dependencies.dart';
import 'presentation/screens/items_list_screen.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _photosRepository = getIt<PhotoRepository>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosCubit(_photosRepository)..fetch(),
      child: MaterialApp(
        title: 'Photos App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {ItemsListScreen.routeName: (context) => ItemsListScreen()},
      ),
    );
  }
}
