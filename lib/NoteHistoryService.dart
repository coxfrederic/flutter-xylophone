import 'package:flutter/material.dart';
import 'package:xylophone/NoteLog.dart';
import 'package:xylophone/NoteData.dart';
import 'package:xylophone/NoteService.dart';

class NoteHistoryService extends ChangeNotifier {
  var soundHistory = [];
  double historyProgress = 0;

  void logSound(NoteData noteData) {
    NoteLog noteLog = new NoteLog(noteData, DateTime.now());
    soundHistory.add(noteLog);
  }

  void clearHistory() {
    soundHistory = []; //Clear history after it has been played
  }

  void playHistory(NoteService noteService) async {
    //return if there is no history
    if (soundHistory.length == 0) return;

    //define variables from the two timepoints to calculate the time difference to wait for the next sound
    DateTime prevTime =
        soundHistory[0].time; //by default it is the time of the first sound
    DateTime nextTime; //will be determined, no default

    var len = soundHistory.length;
    for (int i = 0; i < len; i++) {
      //update the progress bar
      historyProgress = ((i + 1) / len);
      notifyListeners();

      //play the sound
      noteService.playSound(soundHistory[i].noteData);

      if (i < (len - 1)) {
        prevTime = soundHistory[i].time;
        nextTime = soundHistory[i + 1].time;
        //now we wait so the sound can be played at the same pace as recorded
        await Future.delayed(Duration(
            milliseconds: (nextTime.millisecondsSinceEpoch -
                prevTime.millisecondsSinceEpoch)));
      }
    }

    clearHistory();

    //wait one second, then update progress bar to 0
    await Future.delayed(Duration(seconds: 1));
    historyProgress = 0;
    notifyListeners();
  }
}
