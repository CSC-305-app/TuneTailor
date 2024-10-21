import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for lName widget.
  FocusNode? lNameFocusNode;
  TextEditingController? lNameTextController;
  String? Function(BuildContext, String?)? lNameTextControllerValidator;
  // State field(s) for fName widget.
  FocusNode? fNameFocusNode;
  TextEditingController? fNameTextController;
  String? Function(BuildContext, String?)? fNameTextControllerValidator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    lNameFocusNode?.dispose();
    lNameTextController?.dispose();

    fNameFocusNode?.dispose();
    fNameTextController?.dispose();

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();
  }
}
