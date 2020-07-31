import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:xylophone/AudioButtons.dart';
import 'package:xylophone/components/PlayAndClearHistoryButton.dart';
import 'package:xylophone/components/ClearHistoryButton.dart';
import 'package:xylophone/NoteHistoryService.dart';
import 'package:xylophone/NoteService.dart';

class XyloMainScreen extends StatelessWidget {
  final noteService = NoteService();

  List<Widget> getAudioButtons() {
    final widgets = AudioButtons.getAudioButtonsWidgets(noteService);

    widgets.add(Padding(
      padding: EdgeInsets.all(10.0),
    ));

    widgets.add(PlayAndClearHistoryButton(noteService));
    widgets.add(ClearHistoryButton());
    widgets.add(SizedBox(height: 10.0));
    widgets.add((ChangeNotifierProvider.value(
        value: GetIt.I.get<NoteHistoryService>(),
        child: Consumer<NoteHistoryService>(
          builder: (_, noteHistoryService, child) {
            return LinearProgressIndicator(
              backgroundColor: Colors.black,
              value: noteHistoryService.historyProgress,
            );
          },
        ))));

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ChangeNotifierProvider(
            create: (context) => NoteHistoryService(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getAudioButtons(),
            ),
          ),
        ),
      ),
    );
  }
}
