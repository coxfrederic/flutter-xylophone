import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xylophone/NoteHistoryService.dart';

class PlayAndClearHistoryButton extends StatelessWidget {
  final noteService;

  PlayAndClearHistoryButton(this.noteService);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: Colors.blue,
        child: Text(
          "Play and clear history",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () =>
            GetIt.I.get<NoteHistoryService>().playHistory(noteService),
      ),
    );
  }
}
