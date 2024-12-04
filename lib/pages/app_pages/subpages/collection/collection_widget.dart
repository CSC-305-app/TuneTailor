import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/playlist/playlist_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'collection_model.dart';
export 'collection_model.dart';

class CollectionWidget extends StatefulWidget {
  /// A page to store the playlists created by the user, either in the app or
  /// from apps that have been authenticated.
  const CollectionWidget({super.key});

  @override
  State<CollectionWidget> createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget> {
  late CollectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CollectionModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Collection'});
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
        backgroundColor: const Color(0xFFE5E5E5),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                      child: Container(
                        width: 400.0,
                        height: 744.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      'Your Playlists',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: StreamBuilder<List<PlaylistsRecord>>(
                                      stream: queryPlaylistsRecord(
                                        queryBuilder: (playlistsRecord) =>
                                            playlistsRecord.where(
                                          'user',
                                          isEqualTo: currentUserReference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<PlaylistsRecord>
                                            gridViewPlaylistsRecordList =
                                            snapshot.data!;

                                        return GridView.builder(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            5.0,
                                            0,
                                            0,
                                          ),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 4.0,
                                            mainAxisSpacing: 15.0,
                                            childAspectRatio: 1.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: gridViewPlaylistsRecordList
                                              .length,
                                          itemBuilder:
                                              (context, gridViewIndex) {
                                            final gridViewPlaylistsRecord =
                                                gridViewPlaylistsRecordList[
                                                    gridViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'COLLECTION_Container_0ss8215o_ON_TAP');
                                                logFirebaseEvent(
                                                    'Playlist_navigate_to');

                                                context.pushNamed(
                                                    'PlaylistModify');

                                                logFirebaseEvent(
                                                    'Playlist_update_app_state');
                                                FFAppState().selectedPlaylist =
                                                    gridViewPlaylistsRecord
                                                        .reference;
                                                FFAppState()
                                                        .SelectedPlaylistName =
                                                    gridViewPlaylistsRecord
                                                        .title;
                                                FFAppState()
                                                        .SelectedPlaylistPhoto =
                                                    gridViewPlaylistsRecord
                                                        .photoUrl;
                                                safeSetState(() {});
                                              },
                                              child: PlaylistWidget(
                                                key: Key(
                                                    'Key0ss_${gridViewIndex}_of_${gridViewPlaylistsRecordList.length}'),
                                                playlistName:
                                                    gridViewPlaylistsRecord
                                                        .title,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
