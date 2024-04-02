import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  dynamic jsonStudentData;

  dynamic jsonSexes;

  dynamic jsonCitizenship;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (PickList)] action in Profile widget.
  ApiCallResponse? respSexes;
  // Stores action output result for [Backend Call - API (PickList)] action in Profile widget.
  ApiCallResponse? respCitizenship;
  // Stores action output result for [Backend Call - API (StudentData)] action in Profile widget.
  ApiCallResponse? respStudentData;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
