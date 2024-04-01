import '/flutter_flow/flutter_flow_util.dart';
import 'aszf_widget.dart' show AszfWidget;
import 'package:flutter/material.dart';

class AszfModel extends FlutterFlowModel<AszfWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
