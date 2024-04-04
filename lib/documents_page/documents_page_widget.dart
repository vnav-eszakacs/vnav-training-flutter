import '/backend/api_requests/api_calls.dart';
import '/components/card_document_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'documents_page_model.dart';
export 'documents_page_model.dart';

class DocumentsPageWidget extends StatefulWidget {
  const DocumentsPageWidget({super.key});

  @override
  State<DocumentsPageWidget> createState() => _DocumentsPageWidgetState();
}

class _DocumentsPageWidgetState extends State<DocumentsPageWidget> {
  late DocumentsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocumentsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'mrm5xt4g' /* Szükséges dokumentumok */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<ApiCallResponse>(
                    future: GetDocumentTypesCall.call(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final listViewGetDocumentTypesResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final lstTypes = (GetDocumentTypesCall.lstTypes(
                                    listViewGetDocumentTypesResponse.jsonBody,
                                  )?.toList() ??
                                  [])
                              .take(100)
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: lstTypes.length,
                            itemBuilder: (context, lstTypesIndex) {
                              final lstTypesItem = lstTypes[lstTypesIndex];
                              return CardDocumentWidget(
                                key: Key(
                                    'Keyehy_${lstTypesIndex}_of_${lstTypes.length}'),
                                docName: getJsonField(
                                  lstTypesItem,
                                  r'''$.typeName''',
                                ).toString(),
                                docType: getJsonField(
                                  lstTypesItem,
                                  r'''$.type''',
                                ),
                                trainingName: getJsonField(
                                  lstTypesItem,
                                  r'''$.roleId''',
                                ).toString(),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
