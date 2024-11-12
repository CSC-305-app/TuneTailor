import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'survey_model.dart';
export 'survey_model.dart';

class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  late SurveyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'survey'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Survey',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
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
          child: Align(
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('SURVEY_PAGE_BACK_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('settings');
                      },
                      text: 'Back',
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x0057636C),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ],
                ),
                Text(
                  'How likely are you to recommend this app to a friend?\n(1 = Not likely, 10 = Very likely)',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primary,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 1.0,
                    max: 10.0,
                    value: _model.slider1Value ??= 1.0,
                    label: _model.slider1Value?.toStringAsFixed(0),
                    onChanged: (newValue) {
                      newValue = double.parse(newValue.toStringAsFixed(0));
                      safeSetState(() => _model.slider1Value = newValue);
                    },
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.slider1Value?.toString(),
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'How easy is it to navigate the app\'s features?\n(1 = Very difficult, 10 = Very easy)',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primary,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 1.0,
                    max: 10.0,
                    value: _model.slider2Value ??= 1.0,
                    label: _model.slider2Value?.toStringAsFixed(0),
                    onChanged: (newValue) {
                      newValue = double.parse(newValue.toStringAsFixed(0));
                      safeSetState(() => _model.slider2Value = newValue);
                    },
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.slider2Value?.toString(),
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'How satisfied are you with your overall experience using the app?\n(1 = Very dissatisfied, 10 = Very satisfied)',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primary,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 1.0,
                    max: 10.0,
                    value: _model.slider3Value ??= 1.0,
                    label: _model.slider3Value?.toStringAsFixed(0),
                    onChanged: (newValue) {
                      newValue = double.parse(newValue.toStringAsFixed(0));
                      safeSetState(() => _model.slider3Value = newValue);
                    },
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.slider3Value?.toString(),
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'How likely would  you be to use this app again?\n(1 = Very dissatisfied, 10 = Very satisfied)\n',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primary,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 1.0,
                    max: 10.0,
                    value: _model.slider4Value ??= 1.0,
                    label: _model.slider4Value?.toStringAsFixed(0),
                    onChanged: (newValue) async {
                      newValue = double.parse(newValue.toStringAsFixed(0));
                      safeSetState(() => _model.slider4Value = newValue);
                      logFirebaseEvent(
                          'SURVEY_Slider4_ON_FORM_WIDGET_SELECTED');
                      logFirebaseEvent('Slider4_update_app_state');
                      FFAppState().sliderValue4 = FFAppState().sliderValue4;
                      safeSetState(() {});
                    },
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.slider4Value?.toString(),
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('SURVEY_PAGE_SUBMIT_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');

                    await SurveyresponseRecord.collection
                        .doc()
                        .set(createSurveyresponseRecordData(
                          userID: currentUserUid,
                          ratingQuestion2: _model.slider2Value,
                          ratingQuestion3: _model.slider3Value,
                          ratingQuestion4: _model.slider4Value,
                          ratingQuestion1: _model.slider1Value,
                        ));
                    logFirebaseEvent('Button_google_analytics_event');
                    logFirebaseEvent(
                      'survey_submission',
                      parameters: {
                        _model.slider1Value?.toString(): _model.slider1Value,
                        _model.slider2Value?.toString(): _model.slider2Value,
                        _model.slider3Value?.toString(): _model.slider3Value,
                        _model.slider4Value?.toString(): _model.slider4Value,
                        'timestamp': getCurrentTimestamp,
                      },
                    );
                    logFirebaseEvent('Button_navigate_to');

                    context.goNamed('profile');
                  },
                  text: 'Submit',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context)
                        .titleMedium
                        .override(
                          fontFamily: 'Inter Tight',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
