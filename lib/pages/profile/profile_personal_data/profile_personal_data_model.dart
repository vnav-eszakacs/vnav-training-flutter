import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_personal_data_widget.dart' show ProfilePersonalDataWidget;
import 'package:flutter/material.dart';

class ProfilePersonalDataModel
    extends FlutterFlowModel<ProfilePersonalDataWidget> {
  ///  Local state fields for this page.

  int? birthDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtLastName widget.
  FocusNode? txtLastNameFocusNode;
  TextEditingController? txtLastNameController;
  String? Function(BuildContext, String?)? txtLastNameControllerValidator;
  String? _txtLastNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qs478bmq' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtFirstName widget.
  FocusNode? txtFirstNameFocusNode;
  TextEditingController? txtFirstNameController;
  String? Function(BuildContext, String?)? txtFirstNameControllerValidator;
  String? _txtFirstNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9andb8cf' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for lstSex widget.
  String? lstSexValue;
  FormFieldController<String>? lstSexValueController;
  // State field(s) for txtMotherName widget.
  FocusNode? txtMotherNameFocusNode;
  TextEditingController? txtMotherNameController;
  String? Function(BuildContext, String?)? txtMotherNameControllerValidator;
  String? _txtMotherNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3cdhkyq4' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtBirthName widget.
  FocusNode? txtBirthNameFocusNode;
  TextEditingController? txtBirthNameController;
  String? Function(BuildContext, String?)? txtBirthNameControllerValidator;
  String? _txtBirthNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tw0hf3bp' /* Kötelező mező */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for txtBirthPlace widget.
  FocusNode? txtBirthPlaceFocusNode;
  TextEditingController? txtBirthPlaceController;
  String? Function(BuildContext, String?)? txtBirthPlaceControllerValidator;
  // State field(s) for lstBirtCountry widget.
  String? lstBirtCountryValue;
  FormFieldController<String>? lstBirtCountryValueController;
  // Stores action output result for [Backend Call - API (SavePersonalData)] action in Button widget.
  ApiCallResponse? apiResultlts;

  @override
  void initState(BuildContext context) {
    txtLastNameControllerValidator = _txtLastNameControllerValidator;
    txtFirstNameControllerValidator = _txtFirstNameControllerValidator;
    txtMotherNameControllerValidator = _txtMotherNameControllerValidator;
    txtBirthNameControllerValidator = _txtBirthNameControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtLastNameFocusNode?.dispose();
    txtLastNameController?.dispose();

    txtFirstNameFocusNode?.dispose();
    txtFirstNameController?.dispose();

    txtMotherNameFocusNode?.dispose();
    txtMotherNameController?.dispose();

    txtBirthNameFocusNode?.dispose();
    txtBirthNameController?.dispose();

    txtBirthPlaceFocusNode?.dispose();
    txtBirthPlaceController?.dispose();
  }
}
