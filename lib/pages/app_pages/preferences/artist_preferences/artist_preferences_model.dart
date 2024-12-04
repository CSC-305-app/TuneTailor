import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'artist_preferences_widget.dart' show ArtistPreferencesWidget;
import 'package:flutter/material.dart';

class ArtistPreferencesModel extends FlutterFlowModel<ArtistPreferencesWidget> {
  ///  Local state fields for this page.

  List<String> artistNames = [];
  void addToArtistNames(String item) => artistNames.add(item);
  void removeFromArtistNames(String item) => artistNames.remove(item);
  void removeAtIndexFromArtistNames(int index) => artistNames.removeAt(index);
  void insertAtIndexInArtistNames(int index, String item) =>
      artistNames.insert(index, item);
  void updateArtistNamesAtIndex(int index, Function(String) updateFn) =>
      artistNames[index] = updateFn(artistNames[index]);

  List<String> artistImages = [];
  void addToArtistImages(String item) => artistImages.add(item);
  void removeFromArtistImages(String item) => artistImages.remove(item);
  void removeAtIndexFromArtistImages(int index) => artistImages.removeAt(index);
  void insertAtIndexInArtistImages(int index, String item) =>
      artistImages.insert(index, item);
  void updateArtistImagesAtIndex(int index, Function(String) updateFn) =>
      artistImages[index] = updateFn(artistImages[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - ArtistSearchResults] action in AddArtist widget.
  String? artistDetails;
  // Stores action output result for [Backend Call - API (getSingleArtistJSON)] action in AddArtist widget.
  ApiCallResponse? currArtistJSON;
  // Stores action output result for [Backend Call - API (spotifyAccessToken)] action in sendRequest widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
