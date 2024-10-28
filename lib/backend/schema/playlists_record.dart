import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaylistsRecord extends FirestoreRecord {
  PlaylistsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "song_number" field.
  int? _songNumber;
  int get songNumber => _songNumber ?? 0;
  bool hasSongNumber() => _songNumber != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "Photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _songNumber = castToType<int>(snapshotData['song_number']);
    _user = snapshotData['user'] as DocumentReference?;
    _created = snapshotData['created'] as DateTime?;
    _photoUrl = snapshotData['Photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('playlists');

  static Stream<PlaylistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaylistsRecord.fromSnapshot(s));

  static Future<PlaylistsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaylistsRecord.fromSnapshot(s));

  static PlaylistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaylistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaylistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaylistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaylistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaylistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaylistsRecordData({
  String? title,
  int? songNumber,
  DocumentReference? user,
  DateTime? created,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'song_number': songNumber,
      'user': user,
      'created': created,
      'Photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaylistsRecordDocumentEquality implements Equality<PlaylistsRecord> {
  const PlaylistsRecordDocumentEquality();

  @override
  bool equals(PlaylistsRecord? e1, PlaylistsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.songNumber == e2?.songNumber &&
        e1?.user == e2?.user &&
        e1?.created == e2?.created &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(PlaylistsRecord? e) => const ListEquality()
      .hash([e?.title, e?.songNumber, e?.user, e?.created, e?.photoUrl]);

  @override
  bool isValidKey(Object? o) => o is PlaylistsRecord;
}
