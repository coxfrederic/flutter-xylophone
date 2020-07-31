import 'package:audioplayers/audio_cache.dart';
import 'package:xylophone/NoteData.dart';

class NoteService {
  void playSound(NoteData noteData) {
    final audioCache = new AudioCache();
    int soundNumber = noteData.noteIndex;
    audioCache.play("note$soundNumber.wav");
  }
}
