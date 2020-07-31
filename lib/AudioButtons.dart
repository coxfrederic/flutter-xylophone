import 'package:flutter/material.dart';
import 'package:xylophone/NoteData.dart';
import 'package:xylophone/components/AudioButton.dart';
import 'package:xylophone/NoteService.dart';

class AudioButtons {
  static List getAudioButtonsList() {
    final audioButtons = [];
    audioButtons.add(NoteData(1, "Do", Colors.red));
    audioButtons.add(NoteData(2, "Re", Colors.orange));
    audioButtons.add(NoteData(3, "Mi", Colors.yellow));
    audioButtons.add(NoteData(4, "Fa", Colors.green));
    audioButtons.add(NoteData(5, "Sol", Colors.teal));
    audioButtons.add(NoteData(6, "La", Colors.blue));
    audioButtons.add(NoteData(7, "Si", Colors.purple));

    return audioButtons;
  }

  static List getAudioButtonsWidgets(NoteService noteService) {
    final audioButtonsList = getAudioButtonsList();
    final widgets = <Widget>[];

    var len = audioButtonsList.length;

    for (int i = 0; i < len; i++) {
      widgets.add(new AudioButton(audioButtonsList[i], noteService));
    }

    return widgets;
  }
}
