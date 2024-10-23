import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'bottom_navigation_bar_model.dart';
export 'bottom_navigation_bar_model.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
    int? selectedPageIndex,
    bool? hidden,
    bool? showCentralButton,
    this.onTapCentralButton,
  })  : selectedPageIndex = selectedPageIndex ?? 1,
        hidden = hidden ?? false,
        showCentralButton = showCentralButton ?? false;

  final int selectedPageIndex;
  final bool hidden;
  final bool showCentralButton;
  final Future Function()? onTapCentralButton;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with TickerProviderStateMixin {
  late BottomNavigationBarModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavigationBarModel());

    animationsMap.addAll({
      'dividerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: const Offset(0.6, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: const Offset(0.6, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: const Offset(0.6, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: const Offset(0.6, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 4.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.hidden != true,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: 360.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.homeMouseRegionHovered = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.homeMouseRegionHovered = false);
                          }),
                          child: Opacity(
                            opacity: widget.selectedPageIndex == 1 ? 1.0 : 0.5,
                            child: FlutterFlowIconButton(
                              key: const ValueKey('HomeIconButton'),
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 0.0,
                              buttonSize: 50.0,
                              hoverColor:
                                  FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                key: const ValueKey('HomeIconButton'),
                                Icons.cottage_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'BOTTOM_NAVIGATION_BAR_HomeIconButton_ON_');
                                logFirebaseEvent('HomeIconButton_navigate_to');

                                context.pushNamed('social');
                              },
                            ),
                          ),
                        ),
                        if (widget.selectedPageIndex == 1)
                          SizedBox(
                            width: 30.0,
                            child: Divider(
                              height: 2.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation1']!),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.noteMouseRegionHovered = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.noteMouseRegionHovered = false);
                          }),
                          child: Opacity(
                            opacity: widget.selectedPageIndex == 2 ? 1.0 : 0.5,
                            child: FlutterFlowIconButton(
                              key: const ValueKey('NoteIconButton'),
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 0.0,
                              buttonSize: 50.0,
                              hoverColor:
                                  FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                key: const ValueKey('NoteIconButton'),
                                Icons.library_music_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'BOTTOM_NAVIGATION_BAR_NoteIconButton_ON_');
                                logFirebaseEvent('NoteIconButton_navigate_to');

                                context.pushNamed('Collection');
                              },
                            ),
                          ),
                        ),
                        if (widget.selectedPageIndex == 2)
                          SizedBox(
                            width: 30.0,
                            child: Divider(
                              height: 2.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation2']!),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: widget.selectedPageIndex == 3 ? 1.0 : 0.5,
                          child: FlutterFlowIconButton(
                            key: const ValueKey('ProfileIconButton'),
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 0.0,
                            buttonSize: 50.0,
                            hoverColor: FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              key: const ValueKey('ProfileIconButton'),
                              Icons.person_outline,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAVIGATION_BAR_ProfileIconButton_');
                              logFirebaseEvent('ProfileIconButton_navigate_to');

                              context.pushNamed('profile');
                            },
                          ),
                        ),
                        if (widget.selectedPageIndex == 3)
                          SizedBox(
                            width: 30.0,
                            child: Divider(
                              height: 2.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation3']!),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: widget.selectedPageIndex == 4 ? 1.0 : 0.5,
                          child: FlutterFlowIconButton(
                            key: const ValueKey('SettingsIconButton'),
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 0.0,
                            buttonSize: 50.0,
                            hoverColor: FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              key: const ValueKey('SettingsIconButton'),
                              Icons.settings_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAVIGATION_BAR_SettingsIconButton');
                              logFirebaseEvent(
                                  'SettingsIconButton_navigate_to');

                              context.pushNamed('settings');
                            },
                          ),
                        ),
                        if (widget.selectedPageIndex == 4)
                          SizedBox(
                            width: 30.0,
                            child: Divider(
                              height: 2.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation4']!),
                      ],
                    ),
                  ]
                      .divide(const SizedBox(width: 16.0))
                      .addToStart(const SizedBox(width: 16.0))
                      .addToEnd(const SizedBox(width: 16.0)),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: ClipOval(
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        offset: const Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 0.0,
                      buttonSize: 10.0,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 32.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'BOTTOM_NAVIGATION_BAR_CentralIconButton_');
                        logFirebaseEvent('CentralIconButton_navigate_to');

                        context.pushNamed('PlaylistCreation');
                      },
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ),
        ],
      ),
    );
  }
}
