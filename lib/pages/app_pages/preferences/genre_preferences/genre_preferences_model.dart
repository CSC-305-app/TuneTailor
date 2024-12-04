import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'genre_preferences_widget.dart' show GenrePreferencesWidget;
import 'package:flutter/material.dart';

class GenrePreferencesModel extends FlutterFlowModel<GenrePreferencesWidget> {
  ///  Local state fields for this page.

  List<String> selectedGenres = [];
  void addToSelectedGenres(String item) => selectedGenres.add(item);
  void removeFromSelectedGenres(String item) => selectedGenres.remove(item);
  void removeAtIndexFromSelectedGenres(int index) =>
      selectedGenres.removeAt(index);
  void insertAtIndexInSelectedGenres(int index, String item) =>
      selectedGenres.insert(index, item);
  void updateSelectedGenresAtIndex(int index, Function(String) updateFn) =>
      selectedGenres[index] = updateFn(selectedGenres[index]);

  List<String> genreList = [
    'acoustic',
    'afrobeat',
    'alt-rock',
    'alternative',
    'ambient',
    'anime',
    'black-metal',
    'bluegrass',
    'blues',
    'bossanova',
    'brazil',
    'breakbeat',
    'british',
    'cantopop',
    'chicago-house',
    'children',
    'chill',
    'classical',
    'club',
    'comedy',
    'country',
    'dance',
    'dancehall',
    'death-metal',
    'deep-house',
    'detroit-techno',
    'disco',
    'disney',
    'drum-and-bass',
    'dub',
    'dubstep',
    'edm',
    'electro',
    'electronic',
    'emo',
    'folk',
    'forro',
    'french',
    'funk',
    'garage',
    'german',
    'gospel',
    'goth',
    'grindcore',
    'groove',
    'grunge',
    'guitar',
    'happy',
    'hard-rock',
    'hardcore',
    'hardstyle',
    'heavy-metal',
    'hip-hop',
    'holidays',
    'honky-tonk',
    'house',
    'idm',
    'indian',
    'indie',
    'indie-pop',
    'industrial',
    'iranian',
    'j-dance',
    'j-idol',
    'j-pop',
    'j-rock',
    'jazz',
    'k-pop',
    'kids',
    'latin',
    'latino',
    'malay',
    'mandopop',
    'metal',
    'metal-misc',
    'metalcore',
    'minimal-techno',
    'movies',
    'mpb',
    'new-age',
    'new-release',
    'opera',
    'pagode',
    'party',
    'philippines-opm',
    'piano',
    'pop',
    'pop-film',
    'post-dubstep',
    'power-pop',
    'progressive-house',
    'psych-rock',
    'punk',
    'punk-rock',
    'r-n-b',
    'rainy-day',
    'reggae',
    'reggaeton',
    'road-trip',
    'rock',
    'rock-n-roll',
    'rockabilly',
    'romance',
    'sad',
    'salsa',
    'samba',
    'sertanejo',
    'show-tunes',
    'singer-songwriter',
    'ska',
    'sleep',
    'songwriter',
    'soul',
    'soundtracks',
    'spanish',
    'study',
    'summer',
    'swedish',
    'synth-pop',
    'tango',
    'techno',
    'trance',
    'trip-hop',
    'turkish',
    'work-out',
    'world-music'
  ];
  void addToGenreList(String item) => genreList.add(item);
  void removeFromGenreList(String item) => genreList.remove(item);
  void removeAtIndexFromGenreList(int index) => genreList.removeAt(index);
  void insertAtIndexInGenreList(int index, String item) =>
      genreList.insert(index, item);
  void updateGenreListAtIndex(int index, Function(String) updateFn) =>
      genreList[index] = updateFn(genreList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Confirm widget.
  PreferencesRecord? userPreferences;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
