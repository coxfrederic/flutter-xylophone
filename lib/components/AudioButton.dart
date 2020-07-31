import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xylophone/NoteHistoryService.dart';

class AudioButton extends StatelessWidget {
  final noteData;
  final noteService;

  AudioButton(this.noteData, this.noteService);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        child: Text(noteData.noteName),
        color: noteData.noteColor,
        onPressed: () {
          noteService.playSound(noteData);
          GetIt.I.get<NoteHistoryService>().logSound(noteData);
        },
      ),
    );
  }
}
