import '/flutter_flow/flutter_flow_util.dart';
import 'expandable_documents_widget.dart' show ExpandableDocumentsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableDocumentsModel
    extends FlutterFlowModel<ExpandableDocumentsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableController.dispose();
  }
}
