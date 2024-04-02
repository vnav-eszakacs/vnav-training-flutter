import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_address_widget.dart' show ProfileAddressWidget;
import 'package:flutter/material.dart';

class ProfileAddressModel extends FlutterFlowModel<ProfileAddressWidget> {
  ///  Local state fields for this page.

  dynamic locStudentData;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (StudentData)] action in cardHomeAddr widget.
  ApiCallResponse? respStudentData;
  // Stores action output result for [Backend Call - API (StudentData)] action in carPostAddr widget.
  ApiCallResponse? respStudentData2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
