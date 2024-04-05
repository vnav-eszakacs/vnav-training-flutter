import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_document_widget.dart' show CardDocumentWidget;
import 'package:flutter/material.dart';

class CardDocumentModel extends FlutterFlowModel<CardDocumentWidget> {
  ///  Local state fields for this component.

  String? downloadId;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetDocumentUrl)] action in IconButton widget.
  ApiCallResponse? respUrl;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadDocument)] action in IconButton widget.
  ApiCallResponse? respUpload;
  // Stores action output result for [Backend Call - API (SaveDocument)] action in IconButton widget.
  ApiCallResponse? respSaveDocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
