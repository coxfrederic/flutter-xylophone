import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../NoteHistoryService.dart';

class ClearHistoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: Colors.blue,
        child: Text(
          "Clear history",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => GetIt.I.get<NoteHistoryService>().clearHistory(),
      ),
    );
  }
}
