import '/components/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'playlist_creation_widget.dart' show PlaylistCreationWidget;
import 'package:flutter/material.dart';

class PlaylistCreationModel extends FlutterFlowModel<PlaylistCreationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for bottomNavigationBar component.
  late BottomNavigationBarModel bottomNavigationBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavigationBarModel =
        createModel(context, () => BottomNavigationBarModel());
  }

  @override
  void dispose() {
    bottomNavigationBarModel.dispose();
  }
}
