import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'artist_search_results_model.dart';
export 'artist_search_results_model.dart';

class ArtistSearchResultsWidget extends StatefulWidget {
  /// Autocompleted Search results
  const ArtistSearchResultsWidget({super.key});

  @override
  State<ArtistSearchResultsWidget> createState() =>
      _ArtistSearchResultsWidgetState();
}

class _ArtistSearchResultsWidgetState extends State<ArtistSearchResultsWidget> {
  late ArtistSearchResultsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArtistSearchResultsModel());

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Container(
          width: 400.0,
          height: 600.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // could delete this
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 0.0,
                        child: Text(
                          valueOrDefault<String>(
                            _model.test,
                            'null',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.searchTextController,
                            focusNode: _model.searchFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchTextController',
                              const Duration(milliseconds: 100),
                              () async {
                                logFirebaseEvent(
                                    'ARTIST_SEARCH_RESULTS_Search_ON_TEXTFIEL');
                                // Send the api call to get the search results for the current thing typed. if the api fails, don't send anything, just show No results.
                                // Artist API Call
                                logFirebaseEvent('Search_ArtistAPICall');
                                _model.apiArtistResult =
                                    await GetArtistInfoCall.call(
                                  artistName: _model.searchTextController.text,
                                  authToken: FFAppState().spotifyAccessToken,
                                );

                                if ((_model.apiArtistResult?.succeeded ??
                                    true)) {
                                  logFirebaseEvent(
                                      'Search_update_component_state');
                                  _model.searchResults = functions.parseImages(
                                      (_model.apiArtistResult?.jsonBody ??
                                          ''))?[0];
                                  _model.updatePage(() {});
                                }

                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Enter Name of Artist...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.searchTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final artistItem = GetArtistInfoCall.artistItemNames(
                            (_model.apiArtistResult?.jsonBody ?? ''),
                          )?.toList() ??
                          [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: artistItem.length,
                        itemBuilder: (context, artistItemIndex) {
                          final artistItemItem = artistItem[artistItemIndex];
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ARTIST_SEARCH_RESULTS_Row_cdlxzdwi_ON_TA');
                                logFirebaseEvent('Row_firestore_query');
                                _model.userPreferences =
                                    await queryPreferencesRecordOnce(
                                  parent: currentUserReference,
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                logFirebaseEvent('Row_backend_call');

                                await _model.userPreferences!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'artists': FieldValue.arrayUnion([
                                        GetArtistInfoCall.artistItemNames(
                                          (_model.apiArtistResult?.jsonBody ??
                                              ''),
                                        )?[artistItemIndex]
                                      ]),
                                      'artistID': FieldValue.arrayUnion([
                                        GetArtistInfoCall.artistItemSpotifyID(
                                          (_model.apiArtistResult?.jsonBody ??
                                              ''),
                                        )?[artistItemIndex]
                                      ]),
                                      'artistImageURL': FieldValue.arrayUnion([
                                        GetArtistInfoCall.artistItemImagesUrls(
                                          (_model.apiArtistResult?.jsonBody ??
                                              ''),
                                        )?[artistItemIndex]
                                      ]),
                                    },
                                  ),
                                });
                                // return the id of the artist, then parse it in the other page
                                logFirebaseEvent('Row_bottom_sheet');
                                Navigator.pop(
                                    context,
                                    GetArtistInfoCall.artistItemSpotifyID(
                                      (_model.apiArtistResult?.jsonBody ?? ''),
                                    )?[artistItemIndex]);

                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      GetArtistInfoCall.artistItemImagesUrls(
                                        (_model.apiArtistResult?.jsonBody ??
                                            ''),
                                      )![artistItemIndex],
                                      width: 70.0,
                                      height: 70.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 25.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        GetArtistInfoCall.artistItemNames(
                                          (_model.apiArtistResult?.jsonBody ??
                                              ''),
                                        )?[artistItemIndex],
                                        'null',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
