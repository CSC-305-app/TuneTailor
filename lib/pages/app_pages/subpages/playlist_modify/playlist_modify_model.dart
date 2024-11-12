import '/components/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'playlist_modify_widget.dart' show PlaylistModifyWidget;
import 'package:flutter/material.dart';

class PlaylistModifyModel extends FlutterFlowModel<PlaylistModifyWidget> {
  ///  Local state fields for this page.

  bool editMode = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PlaylistTitle widget.
  FocusNode? playlistTitleFocusNode;
  TextEditingController? playlistTitleTextController;
  String? Function(BuildContext, String?)? playlistTitleTextControllerValidator;
  // Model for bottomNavigationBar component.
  late BottomNavigationBarModel bottomNavigationBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavigationBarModel =
        createModel(context, () => BottomNavigationBarModel());
  }

  @override
  void dispose() {
    playlistTitleFocusNode?.dispose();
    playlistTitleTextController?.dispose();

    bottomNavigationBarModel.dispose();
  }
}
