import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fName widget.
  FocusNode? fNameFocusNode;
  TextEditingController? fNameTextController;
  String? Function(BuildContext, String?)? fNameTextControllerValidator;
  // State field(s) for lName widget.
  FocusNode? lNameFocusNode;
  TextEditingController? lNameTextController;
  String? Function(BuildContext, String?)? lNameTextControllerValidator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in finish widget.
  PlaylistsRecord? playlistOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fNameFocusNode?.dispose();
    fNameTextController?.dispose();

    lNameFocusNode?.dispose();
    lNameTextController?.dispose();

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();
  }
}
