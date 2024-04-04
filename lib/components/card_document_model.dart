import '/flutter_flow/flutter_flow_util.dart';
import 'card_document_widget.dart' show CardDocumentWidget;
import 'package:flutter/material.dart';

class CardDocumentModel extends FlutterFlowModel<CardDocumentWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
