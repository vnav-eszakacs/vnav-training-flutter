import '/backend/api_requests/api_calls.dart';
import '/components/card_document_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'expandable_documents_model.dart';
export 'expandable_documents_model.dart';

class ExpandableDocumentsWidget extends StatefulWidget {
  const ExpandableDocumentsWidget({
    super.key,
    required this.trainingName,
    required this.institutionName,
    required this.presenceId,
  });

  final String? trainingName;
  final String? institutionName;
  final String? presenceId;

  @override
  State<ExpandableDocumentsWidget> createState() =>
      _ExpandableDocumentsWidgetState();
}

class _ExpandableDocumentsWidgetState extends State<ExpandableDocumentsWidget> {
  late ExpandableDocumentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpandableDocumentsModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: ExpandableNotifier(
          controller: _model.expandableController,
          child: ExpandablePanel(
            header: Text(
              widget.trainingName!,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            collapsed: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  widget.institutionName!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0x8A000000),
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            expanded: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<ApiCallResponse>(
                  future: GetDocumentTypesCall.call(
                    presenceId: widget.presenceId,
                  ),
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
                                  'Keyysx_${lstTypesIndex}_of_${lstTypes.length}'),
                              docName: getJsonField(
                                lstTypesItem,
                                r'''$.typeName''',
                              ).toString(),
                              docType: 0,
                              roleId: getJsonField(
                                lstTypesItem,
                                r'''$.roleId''',
                              ).toString(),
                              docId: getJsonField(
                                lstTypesItem,
                                r'''$.id''',
                              ).toString(),
                              docMime: getJsonField(
                                lstTypesItem,
                                r'''$.mime''',
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
            theme: const ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: true,
            ),
          ),
        ),
      ),
    );
  }
}
