import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaylistsDataRecord extends FirestoreRecord {
  PlaylistsDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "playlistName" field.
  String? _playlistName;
  String get playlistName => _playlistName ?? '';
  bool hasPlaylistName() => _playlistName != null;

  // "playlistCoverImage" field.
  String? _playlistCoverImage;
  String get playlistCoverImage => _playlistCoverImage ?? '';
  bool hasPlaylistCoverImage() => _playlistCoverImage != null;

  // "numberOfTracks" field.
  int? _numberOfTracks;
  int get numberOfTracks => _numberOfTracks ?? 0;
  bool hasNumberOfTracks() => _numberOfTracks != null;

  // "privatePlaylist" field.
  bool? _privatePlaylist;
  bool get privatePlaylist => _privatePlaylist ?? false;
  bool hasPrivatePlaylist() => _privatePlaylist != null;

  // "trackNames" field.
  List<String>? _trackNames;
  List<String> get trackNames => _trackNames ?? const [];
  bool hasTrackNames() => _trackNames != null;

  // "trackArtist" field.
  List<String>? _trackArtist;
  List<String> get trackArtist => _trackArtist ?? const [];
  bool hasTrackArtist() => _trackArtist != null;

  // "trackImage" field.
  List<String>? _trackImage;
  List<String> get trackImage => _trackImage ?? const [];
  bool hasTrackImage() => _trackImage != null;

  // "trackExplicitBoolean" field.
  List<bool>? _trackExplicitBoolean;
  List<bool> get trackExplicitBoolean => _trackExplicitBoolean ?? const [];
  bool hasTrackExplicitBoolean() => _trackExplicitBoolean != null;

  // "trackDuration" field.
  List<String>? _trackDuration;
  List<String> get trackDuration => _trackDuration ?? const [];
  bool hasTrackDuration() => _trackDuration != null;

  // "trackPopularity" field.
  List<int>? _trackPopularity;
  List<int> get trackPopularity => _trackPopularity ?? const [];
  bool hasTrackPopularity() => _trackPopularity != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _playlistName = snapshotData['playlistName'] as String?;
    _playlistCoverImage = snapshotData['playlistCoverImage'] as String?;
    _numberOfTracks = castToType<int>(snapshotData['numberOfTracks']);
    _privatePlaylist = snapshotData['privatePlaylist'] as bool?;
    _trackNames = getDataList(snapshotData['trackNames']);
    _trackArtist = getDataList(snapshotData['trackArtist']);
    _trackImage = getDataList(snapshotData['trackImage']);
    _trackExplicitBoolean = getDataList(snapshotData['trackExplicitBoolean']);
    _trackDuration = getDataList(snapshotData['trackDuration']);
    _trackPopularity = getDataList(snapshotData['trackPopularity']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('playlistsData')
          : FirebaseFirestore.instance.collectionGroup('playlistsData');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('playlistsData').doc(id);

  static Stream<PlaylistsDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaylistsDataRecord.fromSnapshot(s));

  static Future<PlaylistsDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaylistsDataRecord.fromSnapshot(s));

  static PlaylistsDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaylistsDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaylistsDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaylistsDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaylistsDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaylistsDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaylistsDataRecordData({
  String? playlistName,
  String? playlistCoverImage,
  int? numberOfTracks,
  bool? privatePlaylist,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'playlistName': playlistName,
      'playlistCoverImage': playlistCoverImage,
      'numberOfTracks': numberOfTracks,
      'privatePlaylist': privatePlaylist,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaylistsDataRecordDocumentEquality
    implements Equality<PlaylistsDataRecord> {
  const PlaylistsDataRecordDocumentEquality();

  @override
  bool equals(PlaylistsDataRecord? e1, PlaylistsDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.playlistName == e2?.playlistName &&
        e1?.playlistCoverImage == e2?.playlistCoverImage &&
        e1?.numberOfTracks == e2?.numberOfTracks &&
        e1?.privatePlaylist == e2?.privatePlaylist &&
        listEquality.equals(e1?.trackNames, e2?.trackNames) &&
        listEquality.equals(e1?.trackArtist, e2?.trackArtist) &&
        listEquality.equals(e1?.trackImage, e2?.trackImage) &&
        listEquality.equals(
            e1?.trackExplicitBoolean, e2?.trackExplicitBoolean) &&
        listEquality.equals(e1?.trackDuration, e2?.trackDuration) &&
        listEquality.equals(e1?.trackPopularity, e2?.trackPopularity);
  }

  @override
  int hash(PlaylistsDataRecord? e) => const ListEquality().hash([
        e?.playlistName,
        e?.playlistCoverImage,
        e?.numberOfTracks,
        e?.privatePlaylist,
        e?.trackNames,
        e?.trackArtist,
        e?.trackImage,
        e?.trackExplicitBoolean,
        e?.trackDuration,
        e?.trackPopularity
      ]);

  @override
  bool isValidKey(Object? o) => o is PlaylistsDataRecord;
}
