import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'playlist_modify_model.dart';
export 'playlist_modify_model.dart';

class PlaylistModifyWidget extends StatefulWidget {
  /// Page
  const PlaylistModifyWidget({super.key});

  @override
  State<PlaylistModifyWidget> createState() => _PlaylistModifyWidgetState();
}

class _PlaylistModifyWidgetState extends State<PlaylistModifyWidget> {
  late PlaylistModifyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaylistModifyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PlaylistModify'});
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
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Text(
                                'Playlist Creation',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 20.0),
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PLAYLIST_MODIFY_Icon_gsi329dw_ON_TAP');
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                maxLength: 32,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .playlistTitleTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PLAYLIST_MODIFY_Icon_ekwshy8e_ON_TAP');
                                  logFirebaseEvent('Icon_backend_call');

                                  await PlaylistsRecord.collection
                                      .doc()
                                      .set(createPlaylistsRecordData(
                                        title: _model
                                            .playlistTitleTextController.text,
                                        user: currentUserReference,
                                        created: getCurrentTimestamp,
                                      ));
                                  logFirebaseEvent('Icon_navigate_to');

                                  context.pushNamed('Collection');
                                },
                                child: Icon(
                                  Icons.exit_to_app_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 36.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 2.0,
                        color: Color(0x8C397267),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
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
                                          'PLAYLIST_MODIFY_Container_x68qxrdw_ON_TA');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed('profile');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFBFBFBF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 40.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      75.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PLAYLIST_MODIFY_AddNewSongText_ON_TAP');
                                                  logFirebaseEvent(
                                                      'AddNewSongText_navigate_to');

                                                  context
                                                      .pushNamed('Collection');
                                                },
                                                child: Text(
                                                  'Add New Song',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
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
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.bottomNavigationBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomNavigationBarWidget(
                    hidden: false,
                    showCentralButton: false,
                    onTapCentralButton: () async {},
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
