import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/training_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
            '${currentUserData?.lastName} ${currentUserData?.firstName}',
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
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<ApiCallResponse>(
              future: GetTrainingsCall.call(
                jwtToken: currentAuthenticationToken,
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
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      scrollDirection: Axis.vertical,
                      itemCount: lstTrainings.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                      itemBuilder: (context, lstTrainingsIndex) {
                        final lstTrainingsItem =
                            lstTrainings[lstTrainingsIndex];
                        return TrainingWidget(
                          key: Key(
                              'Keyagh_${lstTrainingsIndex}_of_${lstTrainings.length}'),
                          name: getJsonField(
                            lstTrainingsItem,
                            r'''$.name''',
                          ).toString(),
                          institution: getJsonField(
                            lstTrainingsItem,
                            r'''$.institution''',
                          ).toString(),
                          startDate:
                              functions.createDateTimeFromArray(getJsonField(
                            lstTrainingsItem,
                            r'''$.start''',
                            true,
                          )!),
                          endDate:
                              functions.createDateTimeFromArray(getJsonField(
                            lstTrainingsItem,
                            r'''$.end''',
                            true,
                          )!),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
