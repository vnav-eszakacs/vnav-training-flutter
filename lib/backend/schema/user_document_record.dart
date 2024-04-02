import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDocumentRecord extends FirestoreRecord {
  UserDocumentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "document_type" field.
  int? _documentType;
  int get documentType => _documentType ?? 0;
  bool hasDocumentType() => _documentType != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _documentType = castToType<int>(snapshotData['document_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_document');

  static Stream<UserDocumentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDocumentRecord.fromSnapshot(s));

  static Future<UserDocumentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDocumentRecord.fromSnapshot(s));

  static UserDocumentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDocumentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDocumentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDocumentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDocumentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDocumentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDocumentRecordData({
  String? userId,
  int? documentType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'document_type': documentType,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDocumentRecordDocumentEquality
    implements Equality<UserDocumentRecord> {
  const UserDocumentRecordDocumentEquality();

  @override
  bool equals(UserDocumentRecord? e1, UserDocumentRecord? e2) {
    return e1?.userId == e2?.userId && e1?.documentType == e2?.documentType;
  }

  @override
  int hash(UserDocumentRecord? e) =>
      const ListEquality().hash([e?.userId, e?.documentType]);

  @override
  bool isValidKey(Object? o) => o is UserDocumentRecord;
}
