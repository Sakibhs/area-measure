import 'package:area_and_plot/core/constants/unit_constants.dart';
import 'package:area_and_plot/features/area_calculator/domain/entities/area_calculation.dart';
import 'package:area_and_plot/features/history/domain/entities/history_entry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class HistoryRemoteDataSource {
  Future<List<HistoryEntry>> fetchAll();
  Stream<List<HistoryEntry>> watchAll();
  Future<void> save(HistoryEntry entry);
  Future<void> delete(String id);
  Future<void> updateFavorite(String id, {required bool isFavorite});
}

class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  HistoryRemoteDataSourceImpl(this._firestore, this._auth);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  CollectionReference<Map<String, dynamic>> get _col {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception('User not signed in');
    return _firestore.collection('users').doc(uid).collection('history');
  }

  @override
  Future<List<HistoryEntry>> fetchAll() async {
    final snap = await _col.get();
    return _fromSnapshot(snap);
  }

  @override
  Stream<List<HistoryEntry>> watchAll() {
    return _col.snapshots().map(_fromSnapshot);
  }

  @override
  Future<void> save(HistoryEntry entry) async {
    await _col.doc(entry.id).set(_toMap(entry));
  }

  @override
  Future<void> delete(String id) async {
    await _col.doc(id).delete();
  }

  @override
  Future<void> updateFavorite(String id, {required bool isFavorite}) async {
    await _col.doc(id).update({'isFavorite': isFavorite});
  }

  List<HistoryEntry> _fromSnapshot(QuerySnapshot<Map<String, dynamic>> snap) {
    final entries = snap.docs.map(_docToEntry).toList();
    entries.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return entries;
  }

  HistoryEntry _docToEntry(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final d = doc.data();
    return HistoryEntry(
      id: d['id'] as String,
      type: HistoryType.values.firstWhere((t) => t.name == d['type']),
      areaInSqFt: (d['areaInSqFt'] as num).toDouble(),
      displayUnit:
          AreaUnit.values.firstWhere((u) => u.name == d['displayUnit']),
      createdAt: (d['createdAt'] as Timestamp).toDate(),
      isFavorite: d['isFavorite'] as bool? ?? false,
      label: d['label'] as String?,
      shape: d['shape'] != null
          ? AreaShape.values.firstWhere((s) => s.name == d['shape'])
          : null,
      dimensions: d['dimensions'] != null
          ? List<double>.from(d['dimensions'] as List)
          : null,
      mapPointCount: d['mapPointCount'] as int?,
      mapPoints: d['mapPoints'] != null
          ? List<double>.from(d['mapPoints'] as List)
          : null,
      notes: d['notes'] as String?,
    );
  }

  Map<String, dynamic> _toMap(HistoryEntry e) => {
        'id': e.id,
        'type': e.type.name,
        'areaInSqFt': e.areaInSqFt,
        'displayUnit': e.displayUnit.name,
        'createdAt': Timestamp.fromDate(e.createdAt),
        'isFavorite': e.isFavorite,
        if (e.label != null) 'label': e.label,
        if (e.shape != null) 'shape': e.shape!.name,
        if (e.dimensions != null) 'dimensions': e.dimensions,
        if (e.mapPointCount != null) 'mapPointCount': e.mapPointCount,
        if (e.mapPoints != null) 'mapPoints': e.mapPoints,
        if (e.notes != null) 'notes': e.notes,
      };
}
