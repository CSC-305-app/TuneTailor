import '/components/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'collection_widget.dart' show CollectionWidget;
import 'package:flutter/material.dart';

class CollectionModel extends FlutterFlowModel<CollectionWidget> {
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
