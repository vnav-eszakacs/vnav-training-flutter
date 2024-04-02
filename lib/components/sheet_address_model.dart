import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sheet_address_widget.dart' show SheetAddressWidget;
import 'package:flutter/material.dart';

class SheetAddressModel extends FlutterFlowModel<SheetAddressWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtHomeZip widget.
  FocusNode? txtHomeZipFocusNode;
  TextEditingController? txtHomeZipController;
  String? Function(BuildContext, String?)? txtHomeZipControllerValidator;
  // State field(s) for txtHomeCity widget.
  FocusNode? txtHomeCityFocusNode;
  TextEditingController? txtHomeCityController;
  String? Function(BuildContext, String?)? txtHomeCityControllerValidator;
  // State field(s) for txtHomeAddress widget.
  FocusNode? txtHomeAddressFocusNode;
  TextEditingController? txtHomeAddressController;
  String? Function(BuildContext, String?)? txtHomeAddressControllerValidator;
  // State field(s) for txtPostZip widget.
  FocusNode? txtPostZipFocusNode;
  TextEditingController? txtPostZipController;
  String? Function(BuildContext, String?)? txtPostZipControllerValidator;
  // State field(s) for txtPostCity widget.
  FocusNode? txtPostCityFocusNode;
  TextEditingController? txtPostCityController;
  String? Function(BuildContext, String?)? txtPostCityControllerValidator;
  // State field(s) for txtPostAddress widget.
  FocusNode? txtPostAddressFocusNode;
  TextEditingController? txtPostAddressController;
  String? Function(BuildContext, String?)? txtPostAddressControllerValidator;
  // Stores action output result for [Backend Call - API (SaveAddress)] action in Button widget.
  ApiCallResponse? respSaveAddress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtHomeZipFocusNode?.dispose();
    txtHomeZipController?.dispose();

    txtHomeCityFocusNode?.dispose();
    txtHomeCityController?.dispose();

    txtHomeAddressFocusNode?.dispose();
    txtHomeAddressController?.dispose();

    txtPostZipFocusNode?.dispose();
    txtPostZipController?.dispose();

    txtPostCityFocusNode?.dispose();
    txtPostCityController?.dispose();

    txtPostAddressFocusNode?.dispose();
    txtPostAddressController?.dispose();
  }
}
