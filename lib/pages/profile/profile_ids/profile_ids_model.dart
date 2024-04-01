import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_ids_widget.dart' show ProfileIdsWidget;
import 'package:flutter/material.dart';

class ProfileIdsModel extends FlutterFlowModel<ProfileIdsWidget> {
  ///  Local state fields for this page.

  int? birthDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for lstCitizenship widget.
  String? lstCitizenshipValue;
  FormFieldController<String>? lstCitizenshipValueController;
  // State field(s) for txtIdNumber widget.
  FocusNode? txtIdNumberFocusNode;
  TextEditingController? txtIdNumberController;
  String? Function(BuildContext, String?)? txtIdNumberControllerValidator;
  String? _txtIdNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vnfp65sp' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtTAJ widget.
  FocusNode? txtTAJFocusNode;
  TextEditingController? txtTAJController;
  String? Function(BuildContext, String?)? txtTAJControllerValidator;
  String? _txtTAJControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '66hbd4q5' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtTaxId widget.
  FocusNode? txtTaxIdFocusNode;
  TextEditingController? txtTaxIdController;
  String? Function(BuildContext, String?)? txtTaxIdControllerValidator;
  String? _txtTaxIdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '95x5q4ud' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (SaveIdData)] action in Button widget.
  ApiCallResponse? apiResultlts;

  @override
  void initState(BuildContext context) {
    txtIdNumberControllerValidator = _txtIdNumberControllerValidator;
    txtTAJControllerValidator = _txtTAJControllerValidator;
    txtTaxIdControllerValidator = _txtTaxIdControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtIdNumberFocusNode?.dispose();
    txtIdNumberController?.dispose();

    txtTAJFocusNode?.dispose();
    txtTAJController?.dispose();

    txtTaxIdFocusNode?.dispose();
    txtTaxIdController?.dispose();
  }
}
