import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/blocks/bloc_observer.dart';
import 'pages/twitter_space_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const TwitterSpaceApp());
}

class TwitterSpaceApp extends StatelessWidget {
  const TwitterSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter Space',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TwitterSpacePage(),
    );
  }
}
