import '/flutter_flow/flutter_flow_util.dart';
import 'training_center_widget.dart' show TrainingCenterWidget;
import 'package:flutter/material.dart';

class TrainingCenterModel extends FlutterFlowModel<TrainingCenterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
