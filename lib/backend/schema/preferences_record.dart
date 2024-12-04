import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreferencesRecord extends FirestoreRecord {
  PreferencesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "artists" field.
  List<String>? _artists;
  List<String> get artists => _artists ?? const [];
  bool hasArtists() => _artists != null;

  // "genres" field.
  List<String>? _genres;
  List<String> get genres => _genres ?? const [];
  bool hasGenres() => _genres != null;

  // "artistID" field.
  List<String>? _artistID;
  List<String> get artistID => _artistID ?? const [];
  bool hasArtistID() => _artistID != null;

  // "artistImageURL" field.
  List<String>? _artistImageURL;
  List<String> get artistImageURL => _artistImageURL ?? const [];
  bool hasArtistImageURL() => _artistImageURL != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _artists = getDataList(snapshotData['artists']);
    _genres = getDataList(snapshotData['genres']);
    _artistID = getDataList(snapshotData['artistID']);
    _artistImageURL = getDataList(snapshotData['artistImageURL']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('preferences')
          : FirebaseFirestore.instance.collectionGroup('preferences');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('preferences').doc(id);

  static Stream<PreferencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PreferencesRecord.fromSnapshot(s));

  static Future<PreferencesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PreferencesRecord.fromSnapshot(s));

  static PreferencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PreferencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PreferencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PreferencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PreferencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PreferencesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPreferencesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PreferencesRecordDocumentEquality implements Equality<PreferencesRecord> {
  const PreferencesRecordDocumentEquality();

  @override
  bool equals(PreferencesRecord? e1, PreferencesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.artists, e2?.artists) &&
        listEquality.equals(e1?.genres, e2?.genres) &&
        listEquality.equals(e1?.artistID, e2?.artistID) &&
        listEquality.equals(e1?.artistImageURL, e2?.artistImageURL);
  }

  @override
  int hash(PreferencesRecord? e) => const ListEquality()
      .hash([e?.artists, e?.genres, e?.artistID, e?.artistImageURL]);

  @override
  bool isValidKey(Object? o) => o is PreferencesRecord;
}
