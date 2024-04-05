import '/backend/api_requests/api_calls.dart';
import '/components/expandable_documents_widget.dart';
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
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<ApiCallResponse>(
                    future: GetTrainingsCall.call(),
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
                      final listViewGetTrainingsResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final lstTrainings = (GetTrainingsCall.lstTrainings(
                                    listViewGetTrainingsResponse.jsonBody,
                                  )?.toList() ??
                                  [])
                              .take(100)
                              .toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: lstTrainings.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                            itemBuilder: (context, lstTrainingsIndex) {
                              final lstTrainingsItem =
                                  lstTrainings[lstTrainingsIndex];
                              return ExpandableDocumentsWidget(
                                key: Key(
                                    'Keyx6r_${lstTrainingsIndex}_of_${lstTrainings.length}'),
                                trainingName: getJsonField(
                                  lstTrainingsItem,
                                  r'''$.name''',
                                ).toString(),
                                institutionName: getJsonField(
                                  lstTrainingsItem,
                                  r'''$.institution''',
                                ).toString(),
                                presenceId: getJsonField(
                                  lstTrainingsItem,
                                  r'''$.presenceId''',
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
