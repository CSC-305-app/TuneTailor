import '/flutter_flow/flutter_flow_util.dart';
import 'playlist_modify_widget.dart' show PlaylistModifyWidget;
import 'package:flutter/material.dart';

class PlaylistModifyModel extends FlutterFlowModel<PlaylistModifyWidget> {
  ///  Local state fields for this page.

  bool editMode = false;

  List<String> trackName = [];
  void addToTrackName(String item) => trackName.add(item);
  void removeFromTrackName(String item) => trackName.remove(item);
  void removeAtIndexFromTrackName(int index) => trackName.removeAt(index);
  void insertAtIndexInTrackName(int index, String item) =>
      trackName.insert(index, item);
  void updateTrackNameAtIndex(int index, Function(String) updateFn) =>
      trackName[index] = updateFn(trackName[index]);

  List<String> trackArtist = [];
  void addToTrackArtist(String item) => trackArtist.add(item);
  void removeFromTrackArtist(String item) => trackArtist.remove(item);
  void removeAtIndexFromTrackArtist(int index) => trackArtist.removeAt(index);
  void insertAtIndexInTrackArtist(int index, String item) =>
      trackArtist.insert(index, item);
  void updateTrackArtistAtIndex(int index, Function(String) updateFn) =>
      trackArtist[index] = updateFn(trackArtist[index]);

  List<String> trackDuration = [];
  void addToTrackDuration(String item) => trackDuration.add(item);
  void removeFromTrackDuration(String item) => trackDuration.remove(item);
  void removeAtIndexFromTrackDuration(int index) =>
      trackDuration.removeAt(index);
  void insertAtIndexInTrackDuration(int index, String item) =>
      trackDuration.insert(index, item);
  void updateTrackDurationAtIndex(int index, Function(String) updateFn) =>
      trackDuration[index] = updateFn(trackDuration[index]);

  List<String> trackCoverImage = [];
  void addToTrackCoverImage(String item) => trackCoverImage.add(item);
  void removeFromTrackCoverImage(String item) => trackCoverImage.remove(item);
  void removeAtIndexFromTrackCoverImage(int index) =>
      trackCoverImage.removeAt(index);
  void insertAtIndexInTrackCoverImage(int index, String item) =>
      trackCoverImage.insert(index, item);
  void updateTrackCoverImageAtIndex(int index, Function(String) updateFn) =>
      trackCoverImage[index] = updateFn(trackCoverImage[index]);

  List<bool> trackExplicit = [];
  void addToTrackExplicit(bool item) => trackExplicit.add(item);
  void removeFromTrackExplicit(bool item) => trackExplicit.remove(item);
  void removeAtIndexFromTrackExplicit(int index) =>
      trackExplicit.removeAt(index);
  void insertAtIndexInTrackExplicit(int index, bool item) =>
      trackExplicit.insert(index, item);
  void updateTrackExplicitAtIndex(int index, Function(bool) updateFn) =>
      trackExplicit[index] = updateFn(trackExplicit[index]);

  List<int> trackPopularity = [];
  void addToTrackPopularity(int item) => trackPopularity.add(item);
  void removeFromTrackPopularity(int item) => trackPopularity.remove(item);
  void removeAtIndexFromTrackPopularity(int index) =>
      trackPopularity.removeAt(index);
  void insertAtIndexInTrackPopularity(int index, int item) =>
      trackPopularity.insert(index, item);
  void updateTrackPopularityAtIndex(int index, Function(int) updateFn) =>
      trackPopularity[index] = updateFn(trackPopularity[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for PlaylistTitle widget.
  FocusNode? playlistTitleFocusNode;
  TextEditingController? playlistTitleTextController;
  String? Function(BuildContext, String?)? playlistTitleTextControllerValidator;
  // Stores action output result for [Bottom Sheet - TrackSearchResults] action in Container widget.
  dynamic trackDetails;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    playlistTitleFocusNode?.dispose();
    playlistTitleTextController?.dispose();
  }
}
