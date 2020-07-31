import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xylophone/NoteHistoryService.dart';
import 'package:xylophone/screens/XyloMainScreen.dart';

void main() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<NoteHistoryService>(() => NoteHistoryService());

  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: XyloMainScreen(),
    );
  }
}
