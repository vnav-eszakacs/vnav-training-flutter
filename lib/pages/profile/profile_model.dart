import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  dynamic jsonStudentData;

  dynamic jsonSexes;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (StudentData)] action in Profile widget.
  ApiCallResponse? respStudentData;
  // Stores action output result for [Backend Call - API (PickList)] action in Profile widget.
  ApiCallResponse? respSexes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
