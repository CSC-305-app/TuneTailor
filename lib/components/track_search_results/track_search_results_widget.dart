import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'track_search_results_model.dart';
export 'track_search_results_model.dart';

class TrackSearchResultsWidget extends StatefulWidget {
  /// Autocompleted Search results
  const TrackSearchResultsWidget({super.key});

  @override
  State<TrackSearchResultsWidget> createState() =>
      _TrackSearchResultsWidgetState();
}

class _TrackSearchResultsWidgetState extends State<TrackSearchResultsWidget> {
  late TrackSearchResultsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackSearchResultsModel());

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
                        child: TextFormField(
                          controller: _model.searchTextController,
                          focusNode: _model.searchFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchTextController',
                            const Duration(milliseconds: 100),
                            () async {
                              logFirebaseEvent(
                                  'TRACK_SEARCH_RESULTS_Search_ON_TEXTFIELD');
                              // Send the api call to get the search results for the current thing typed. if the api fails, don't send anything, just show No results.
                              // Artist API Call
                              logFirebaseEvent('Search_ArtistAPICall');
                              _model.apiTrackResult =
                                  await GetTrackInfoCall.call(
                                authToken: FFAppState().spotifyAccessToken,
                                trackName: _model.searchTextController.text,
                              );

                              if ((_model.apiTrackResult?.succeeded ?? true)) {
                                logFirebaseEvent(
                                    'Search_update_component_state');
                                _model.searchResults = functions.parseTracks(
                                    (_model.apiTrackResult?.jsonBody ?? ''))[0];
                                _model.images = functions
                                    .extractFirstTrackImages(
                                        (_model.apiTrackResult?.jsonBody ??
                                            ''))!
                                    .toList()
                                    .cast<String>();
                                safeSetState(() {});
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
                            hintText: 'Enter Name of Track...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.searchTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final artistItem = GetTrackInfoCall.trackURI(
                            (_model.apiTrackResult?.jsonBody ?? ''),
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
                                    'TRACK_SEARCH_RESULTS_Row_zfdf5d9v_ON_TAP');
                                logFirebaseEvent('Row_update_component_state');
                                _model.returnData = functions.createTrackJson(
                                    GetTrackInfoCall.songName(
                                      (_model.apiTrackResult?.jsonBody ?? ''),
                                    )![artistItemIndex],
                                    GetTrackInfoCall.artistName(
                                      (_model.apiTrackResult?.jsonBody ?? ''),
                                    )![artistItemIndex],
                                    functions.formatSecondsToMinutes(
                                        functions.convertMsToSeconds(
                                            GetTrackInfoCall.trackDuration(
                                      (_model.apiTrackResult?.jsonBody ?? ''),
                                    )![artistItemIndex])),
                                    _model.images[artistItemIndex],
                                    GetTrackInfoCall.trackExplicitBool(
                                      (_model.apiTrackResult?.jsonBody ?? ''),
                                    )![artistItemIndex],
                                    GetTrackInfoCall.trackPopularity(
                                      (_model.apiTrackResult?.jsonBody ?? ''),
                                    )![artistItemIndex]);
                                safeSetState(() {});
                                logFirebaseEvent('Row_bottom_sheet');
                                Navigator.pop(context, _model.returnData);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        _model.images[artistItemIndex],
                                        width: 70.0,
                                        height: 70.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 320.0,
                                    height: 70.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 320.0,
                                          height: 50.0,
                                          decoration: const BoxDecoration(),
                                          child: Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  GetTrackInfoCall.songName(
                                                    (_model.apiTrackResult
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[artistItemIndex],
                                                  'null',
                                                ),
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            if ((GetTrackInfoCall
                                                    .trackExplicitBool(
                                                  (_model.apiTrackResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[artistItemIndex]) ==
                                                true)
                                              Icon(
                                                Icons.explicit,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.formatSecondsToMinutes(
                                                    functions
                                                        .convertMsToSeconds(
                                                            GetTrackInfoCall
                                                                .trackDuration(
                                                  (_model.apiTrackResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )![artistItemIndex])),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
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
