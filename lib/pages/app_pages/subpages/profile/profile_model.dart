import '/components/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
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
  // Model for bottomNavigationBar component.
  late BottomNavigationBarModel bottomNavigationBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavigationBarModel =
        createModel(context, () => BottomNavigationBarModel());
  }

  @override
  void dispose() {
    profileFNameFocusNode?.dispose();
    profileFNameTextController?.dispose();

    profileLNameFocusNode?.dispose();
    profileLNameTextController?.dispose();

    bottomNavigationBarModel.dispose();
  }
}
