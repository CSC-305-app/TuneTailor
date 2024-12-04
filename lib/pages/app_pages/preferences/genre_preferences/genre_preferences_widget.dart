import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'genre_preferences_model.dart';
export 'genre_preferences_model.dart';

class GenrePreferencesWidget extends StatefulWidget {
  const GenrePreferencesWidget({super.key});

  @override
  State<GenrePreferencesWidget> createState() => _GenrePreferencesWidgetState();
}

class _GenrePreferencesWidgetState extends State<GenrePreferencesWidget> {
  late GenrePreferencesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenrePreferencesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'GenrePreferences'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Select at least three genres you enjoy',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final gen = _model.genreList.toList();

                        return MasonryGridView.builder(
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          itemCount: gen.length,
                          itemBuilder: (context, genIndex) {
                            final genItem = gen[genIndex];
                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'GENRE_PREFERENCES_Button_7ojkli2q_ON_TAP');
                                if (_model.selectedGenres.contains(genItem)) {
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.removeFromSelectedGenres(genItem);
                                  safeSetState(() {});
                                  return;
                                } else {
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.addToSelectedGenres(genItem);
                                  safeSetState(() {});
                                  return;
                                }
                              },
                              text: genItem,
                              options: FFButtonOptions(
                                height: 60.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.selectedGenres.contains(genItem)
                                    ? Colors.white
                                    : Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: _model.selectedGenres
                                              .contains(genItem)
                                          ? Colors.black
                                          : Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('GENRE_PREFERENCES_PAGE_Confirm_ON_TAP');
                  var shouldSetState = false;
                  if (_model.selectedGenres.length > 2) {
                    logFirebaseEvent('Confirm_navigate_to');

                    context.pushNamed('profile');

                    logFirebaseEvent('Confirm_firestore_query');
                    _model.userPreferences = await queryPreferencesRecordOnce(
                      parent: currentUserReference,
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    shouldSetState = true;
                    logFirebaseEvent('Confirm_backend_call');

                    await _model.userPreferences!.reference.update({
                      ...mapToFirestore(
                        {
                          'genres': _model.selectedGenres,
                        },
                      ),
                    });
                    if (shouldSetState) safeSetState(() {});
                    return;
                  } else {
                    if (shouldSetState) safeSetState(() {});
                    return;
                  }

                  if (shouldSetState) safeSetState(() {});
                },
                text: 'Confirm selections',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
