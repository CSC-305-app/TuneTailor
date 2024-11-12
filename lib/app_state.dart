import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _sliderValue = prefs.getInt('ff_sliderValue') ?? _sliderValue;
    });
    _safeInit(() {
      _sliderValue2 = prefs.getInt('ff_sliderValue2') ?? _sliderValue2;
    });
    _safeInit(() {
      _sliderValue3 = prefs.getInt('ff_sliderValue3') ?? _sliderValue3;
    });
    _safeInit(() {
      _sliderValue4 = prefs.getInt('ff_sliderValue4') ?? _sliderValue4;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _sliderValue = 1;
  int get sliderValue => _sliderValue;
  set sliderValue(int value) {
    _sliderValue = value;
    prefs.setInt('ff_sliderValue', value);
  }

  int _sliderValue2 = 1;
  int get sliderValue2 => _sliderValue2;
  set sliderValue2(int value) {
    _sliderValue2 = value;
    prefs.setInt('ff_sliderValue2', value);
  }

  int _sliderValue3 = 1;
  int get sliderValue3 => _sliderValue3;
  set sliderValue3(int value) {
    _sliderValue3 = value;
    prefs.setInt('ff_sliderValue3', value);
  }

  int _sliderValue4 = 1;
  int get sliderValue4 => _sliderValue4;
  set sliderValue4(int value) {
    _sliderValue4 = value;
    prefs.setInt('ff_sliderValue4', value);
  }

  String _authError = '';
  String get authError => _authError;
  set authError(String value) {
    _authError = value;
  }

  DocumentReference? _selectedPlaylist;
  DocumentReference? get selectedPlaylist => _selectedPlaylist;
  set selectedPlaylist(DocumentReference? value) {
    _selectedPlaylist = value;
  }

  String _SelectedPlaylistName = '';
  String get SelectedPlaylistName => _SelectedPlaylistName;
  set SelectedPlaylistName(String value) {
    _SelectedPlaylistName = value;
  }

  String _SelectedPlaylistPhoto = '';
  String get SelectedPlaylistPhoto => _SelectedPlaylistPhoto;
  set SelectedPlaylistPhoto(String value) {
    _SelectedPlaylistPhoto = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
