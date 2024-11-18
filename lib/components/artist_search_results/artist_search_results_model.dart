import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'artist_search_results_widget.dart' show ArtistSearchResultsWidget;
import 'package:flutter/material.dart';

class ArtistSearchResultsModel
    extends FlutterFlowModel<ArtistSearchResultsWidget> {
  ///  Local state fields for this component.

  dynamic searchResults;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Stores action output result for [Backend Call - API (getArtistInfo)] action in Submit widget.
  ApiCallResponse? apiArtistResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
