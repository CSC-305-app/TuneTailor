import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for ProfileFName widget.
  FocusNode? profileFNameFocusNode;
  TextEditingController? profileFNameTextController;
  String? Function(BuildContext, String?)? profileFNameTextControllerValidator;
  // State field(s) for ProfileLName widget.
  FocusNode? profileLNameFocusNode;
  TextEditingController? profileLNameTextController;
  String? Function(BuildContext, String?)? profileLNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    profileFNameFocusNode?.dispose();
    profileFNameTextController?.dispose();

    profileLNameFocusNode?.dispose();
    profileLNameTextController?.dispose();
  }
}
