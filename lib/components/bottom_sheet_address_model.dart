import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_sheet_address_widget.dart' show BottomSheetAddressWidget;
import 'package:flutter/material.dart';

class BottomSheetAddressModel
    extends FlutterFlowModel<BottomSheetAddressWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtZip widget.
  FocusNode? txtZipFocusNode;
  TextEditingController? txtZipController;
  String? Function(BuildContext, String?)? txtZipControllerValidator;
  // State field(s) for txtCity widget.
  FocusNode? txtCityFocusNode;
  TextEditingController? txtCityController;
  String? Function(BuildContext, String?)? txtCityControllerValidator;
  // State field(s) for txtAddress widget.
  FocusNode? txtAddressFocusNode;
  TextEditingController? txtAddressController;
  String? Function(BuildContext, String?)? txtAddressControllerValidator;
  // Stores action output result for [Backend Call - API (SaveAddressMain)] action in btnSave widget.
  ApiCallResponse? respAddrMain;
  // Stores action output result for [Backend Call - API (SaveAddressPost)] action in btnSave widget.
  ApiCallResponse? respAddrPost;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtZipFocusNode?.dispose();
    txtZipController?.dispose();

    txtCityFocusNode?.dispose();
    txtCityController?.dispose();

    txtAddressFocusNode?.dispose();
    txtAddressController?.dispose();
  }
}
