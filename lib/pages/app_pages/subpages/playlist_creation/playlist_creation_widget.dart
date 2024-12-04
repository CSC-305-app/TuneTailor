import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/track_search_results/track_search_results_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'playlist_creation_model.dart';
export 'playlist_creation_model.dart';

class PlaylistCreationWidget extends StatefulWidget {
  /// Page
  const PlaylistCreationWidget({super.key});

  @override
  State<PlaylistCreationWidget> createState() => _PlaylistCreationWidgetState();
}

class _PlaylistCreationWidgetState extends State<PlaylistCreationWidget> {
  late PlaylistCreationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaylistCreationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PlaylistCreation'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLAYLIST_CREATION_PlaylistCreation_ON_IN');
      logFirebaseEvent('PlaylistCreation_backend_call');
      _model.apiResult = await SpotifyAccessTokenCall.call();

      if ((_model.apiResult?.succeeded ?? true)) {
        logFirebaseEvent('PlaylistCreation_update_app_state');
        FFAppState().spotifyAccessToken = SpotifyAccessTokenCall.accessToken(
          (_model.apiResult?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
      }
    });

    _model.playlistTitleTextController ??= TextEditingController();
    _model.playlistTitleFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFE5E5E5),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          valueOrDefault<String>(
                            _model.playlistTitleTextController.text,
                            'Create Playlist',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.edit_square,
                          color: Color(0xFFBFBFBF),
                          size: 36.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                  color: Color(0x8C397267),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18.0),
                              child: Image.network(
                                'https://picsum.photos/seed/465/600',
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              buttonSize: double.infinity,
                              icon: Icon(
                                Icons.photo_outlined,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('AddPlaylistArtButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: 0.0,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PLAYLIST_CREATION_Icon_aevwwoxt_ON_TAP');
                            logFirebaseEvent('Icon_navigate_to');

                            context.pushNamed('Collection');
                          },
                          child: Icon(
                            Icons.cancel,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 36.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: SizedBox(
                        width: 200.0,
                        child: TextFormField(
                          controller: _model.playlistTitleTextController,
                          focusNode: _model.playlistTitleFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Custom Playlist',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            filled: true,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          maxLength: 32,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.playlistTitleTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PLAYLIST_CREATION_Icon_0pm229vj_ON_TAP');
                        if (!(currentUserDocument?.playlistRef != null)) {
                          logFirebaseEvent('Icon_backend_call');

                          var playlistsRecordReference =
                              PlaylistsRecord.collection.doc();
                          await playlistsRecordReference
                              .set(createPlaylistsRecordData(
                            user: currentUserReference,
                          ));
                          _model.playlistRef =
                              PlaylistsRecord.getDocumentFromData(
                                  createPlaylistsRecordData(
                                    user: currentUserReference,
                                  ),
                                  playlistsRecordReference);
                          logFirebaseEvent('Icon_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            playlistRef: _model.playlistRef?.reference,
                          ));
                        }
                        // if the user doesn't have a playlist collection (because they made their account before it was implemented) have a conditional to create one for them if necessary.
                        logFirebaseEvent('Icon_backend_call');

                        var playlistsDataRecordReference =
                            PlaylistsDataRecord.createDoc(
                                currentUserDocument!.playlistRef!);
                        await playlistsDataRecordReference.set({
                          ...createPlaylistsDataRecordData(
                            playlistName:
                                _model.playlistTitleTextController.text,
                          ),
                          ...mapToFirestore(
                            {
                              'trackNames': _model.trackName,
                              'trackArtist': _model.trackArtist,
                              'trackImage': _model.trackCoverImage,
                              'trackExplicitBoolean': _model.trackExplicit,
                              'trackDuration': _model.trackDuration,
                              'trackPopularity': _model.trackPopularity,
                            },
                          ),
                        });
                        _model.createdPlaylist =
                            PlaylistsDataRecord.getDocumentFromData({
                          ...createPlaylistsDataRecordData(
                            playlistName:
                                _model.playlistTitleTextController.text,
                          ),
                          ...mapToFirestore(
                            {
                              'trackNames': _model.trackName,
                              'trackArtist': _model.trackArtist,
                              'trackImage': _model.trackCoverImage,
                              'trackExplicitBoolean': _model.trackExplicit,
                              'trackDuration': _model.trackDuration,
                              'trackPopularity': _model.trackPopularity,
                            },
                          ),
                        }, playlistsDataRecordReference);
                        logFirebaseEvent('Icon_backend_call');

                        await currentUserDocument!.playlistRef!.update({
                          ...mapToFirestore(
                            {
                              'albumDocReferences': FieldValue.arrayUnion(
                                  [_model.createdPlaylist?.reference]),
                            },
                          ),
                        });
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed('Collection');

                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2.0,
                  color: Color(0x8C397267),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PLAYLIST_CREATION_Container_ozsg0iti_ON_');
                                logFirebaseEvent('Container_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: const TrackSearchResultsWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(
                                    () => _model.returnJson = value));

                                if (getJsonField(
                                      _model.returnJson,
                                      r'''$.trackName''',
                                    ) !=
                                    null) {
                                  logFirebaseEvent(
                                      'Container_update_page_state');
                                  _model.addToTrackName(getJsonField(
                                    _model.returnJson,
                                    r'''$.trackName''',
                                  ).toString());
                                  _model.addToTrackArtist(getJsonField(
                                    _model.returnJson,
                                    r'''$.trackArtist''',
                                  ).toString());
                                  _model.addToTrackDuration(getJsonField(
                                    _model.returnJson,
                                    r'''$.trackDuration''',
                                  ).toString());
                                  _model.addToTrackCoverImage(getJsonField(
                                    _model.returnJson,
                                    r'''$.trackCoverImage''',
                                  ).toString());
                                  _model.addToTrackExplicit(getJsonField(
                                    _model.returnJson,
                                    r'''$.trackExplicit''',
                                  ));
                                  _model.addToTrackPopularity(getJsonField(
                                    _model.returnJson,
                                    r'''$.trackPopularity''',
                                  ));
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFBFBFBF),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: const Color(0xFFBFBFBF),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            75.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Add New Song',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 350.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child:
                                // Songs will be capped at 500 per playlist to keep storage from overflowing.
                                Builder(
                              builder: (context) {
                                final addedSongs = _model.trackName
                                    .map((e) => e)
                                    .toList()
                                    .take(500)
                                    .toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: addedSongs.length,
                                  itemBuilder: (context, addedSongsIndex) {
                                    final addedSongsItem =
                                        addedSongs[addedSongsIndex];
                                    return Container(
                                      height: 100.0,
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              _model.trackCoverImage[
                                                  addedSongsIndex],
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 285.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model.trackExplicit[
                                                                addedSongsIndex] ==
                                                            true)
                                                          Icon(
                                                            Icons.explicit,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Track:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          _model.trackName[
                                                              addedSongsIndex],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Artist:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                        ),
                                                        AutoSizeText(
                                                          _model.trackArtist[
                                                              addedSongsIndex],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Duration:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          _model.trackDuration[
                                                              addedSongsIndex],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Popularity:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          _model
                                                              .trackPopularity[
                                                                  addedSongsIndex]
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
