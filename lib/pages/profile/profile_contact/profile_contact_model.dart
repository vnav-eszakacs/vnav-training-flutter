import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_contact_widget.dart' show ProfileContactWidget;
import 'package:flutter/material.dart';

class ProfileContactModel extends FlutterFlowModel<ProfileContactWidget> {
  ///  Local state fields for this page.

  int? birthDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  String? _txtEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oor6okh5' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtPhone widget.
  FocusNode? txtPhoneFocusNode;
  TextEditingController? txtPhoneController;
  String? Function(BuildContext, String?)? txtPhoneControllerValidator;
  String? _txtPhoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4d42tdae' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (SaveContactData)] action in Button widget.
  ApiCallResponse? apiResultlts;

  @override
  void initState(BuildContext context) {
    txtEmailControllerValidator = _txtEmailControllerValidator;
    txtPhoneControllerValidator = _txtPhoneControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtPhoneFocusNode?.dispose();
    txtPhoneController?.dispose();
  }
}
