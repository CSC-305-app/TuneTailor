import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveyresponseRecord extends FirestoreRecord {
  SurveyresponseRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "rating_question2" field.
  int? _ratingQuestion2;
  int get ratingQuestion2 => _ratingQuestion2 ?? 0;
  bool hasRatingQuestion2() => _ratingQuestion2 != null;

  // "rating_question3" field.
  int? _ratingQuestion3;
  int get ratingQuestion3 => _ratingQuestion3 ?? 0;
  bool hasRatingQuestion3() => _ratingQuestion3 != null;

  // "rating_question4" field.
  int? _ratingQuestion4;
  int get ratingQuestion4 => _ratingQuestion4 ?? 0;
  bool hasRatingQuestion4() => _ratingQuestion4 != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "rating_question1" field.
  int? _ratingQuestion1;
  int get ratingQuestion1 => _ratingQuestion1 ?? 0;
  bool hasRatingQuestion1() => _ratingQuestion1 != null;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _ratingQuestion2 = castToType<int>(snapshotData['rating_question2']);
    _ratingQuestion3 = castToType<int>(snapshotData['rating_question3']);
    _ratingQuestion4 = castToType<int>(snapshotData['rating_question4']);
    _userID = snapshotData['userID'] as String?;
    _ratingQuestion1 = castToType<int>(snapshotData['rating_question1']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Surveyresponse');

  static Stream<SurveyresponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveyresponseRecord.fromSnapshot(s));

  static Future<SurveyresponseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveyresponseRecord.fromSnapshot(s));

  static SurveyresponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveyresponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveyresponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveyresponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveyresponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveyresponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveyresponseRecordData({
  DateTime? timestamp,
  int? ratingQuestion2,
  int? ratingQuestion3,
  int? ratingQuestion4,
  String? userID,
  int? ratingQuestion1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'rating_question2': ratingQuestion2,
      'rating_question3': ratingQuestion3,
      'rating_question4': ratingQuestion4,
      'userID': userID,
      'rating_question1': ratingQuestion1,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveyresponseRecordDocumentEquality
    implements Equality<SurveyresponseRecord> {
  const SurveyresponseRecordDocumentEquality();

  @override
  bool equals(SurveyresponseRecord? e1, SurveyresponseRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.ratingQuestion2 == e2?.ratingQuestion2 &&
        e1?.ratingQuestion3 == e2?.ratingQuestion3 &&
        e1?.ratingQuestion4 == e2?.ratingQuestion4 &&
        e1?.userID == e2?.userID &&
        e1?.ratingQuestion1 == e2?.ratingQuestion1;
  }

  @override
  int hash(SurveyresponseRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.ratingQuestion2,
        e?.ratingQuestion3,
        e?.ratingQuestion4,
        e?.userID,
        e?.ratingQuestion1
      ]);

  @override
  bool isValidKey(Object? o) => o is SurveyresponseRecord;
}
