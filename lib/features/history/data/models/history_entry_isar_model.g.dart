// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entry_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHistoryEntryIsarModelCollection on Isar {
  IsarCollection<HistoryEntryIsarModel> get historyEntryIsarModels =>
      this.collection();
}

const HistoryEntryIsarModelSchema = CollectionSchema(
  name: r'HistoryEntryIsarModel',
  id: -1471206098889658919,
  properties: {
    r'areaInSqFt': PropertySchema(
      id: 0,
      name: r'areaInSqFt',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dimensions': PropertySchema(
      id: 2,
      name: r'dimensions',
      type: IsarType.doubleList,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 4,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'label': PropertySchema(
      id: 5,
      name: r'label',
      type: IsarType.string,
    ),
    r'mapPointCount': PropertySchema(
      id: 6,
      name: r'mapPointCount',
      type: IsarType.long,
    ),
    r'shapeIndex': PropertySchema(
      id: 7,
      name: r'shapeIndex',
      type: IsarType.string,
    ),
    r'typeIndex': PropertySchema(
      id: 8,
      name: r'typeIndex',
      type: IsarType.string,
    ),
    r'unitIndex': PropertySchema(
      id: 9,
      name: r'unitIndex',
      type: IsarType.string,
    )
  },
  estimateSize: _historyEntryIsarModelEstimateSize,
  serialize: _historyEntryIsarModelSerialize,
  deserialize: _historyEntryIsarModelDeserialize,
  deserializeProp: _historyEntryIsarModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _historyEntryIsarModelGetId,
  getLinks: _historyEntryIsarModelGetLinks,
  attach: _historyEntryIsarModelAttach,
  version: '3.1.0+1',
);

int _historyEntryIsarModelEstimateSize(
  HistoryEntryIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dimensions;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.shapeIndex;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.typeIndex.length * 3;
  bytesCount += 3 + object.unitIndex.length * 3;
  return bytesCount;
}

void _historyEntryIsarModelSerialize(
  HistoryEntryIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.areaInSqFt);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDoubleList(offsets[2], object.dimensions);
  writer.writeString(offsets[3], object.id);
  writer.writeBool(offsets[4], object.isFavorite);
  writer.writeString(offsets[5], object.label);
  writer.writeLong(offsets[6], object.mapPointCount);
  writer.writeString(offsets[7], object.shapeIndex);
  writer.writeString(offsets[8], object.typeIndex);
  writer.writeString(offsets[9], object.unitIndex);
}

HistoryEntryIsarModel _historyEntryIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HistoryEntryIsarModel();
  object.areaInSqFt = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.dimensions = reader.readDoubleList(offsets[2]);
  object.id = reader.readString(offsets[3]);
  object.isFavorite = reader.readBool(offsets[4]);
  object.isarId = id;
  object.label = reader.readStringOrNull(offsets[5]);
  object.mapPointCount = reader.readLongOrNull(offsets[6]);
  object.shapeIndex = reader.readStringOrNull(offsets[7]);
  object.typeIndex = reader.readString(offsets[8]);
  object.unitIndex = reader.readString(offsets[9]);
  return object;
}

P _historyEntryIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDoubleList(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _historyEntryIsarModelGetId(HistoryEntryIsarModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _historyEntryIsarModelGetLinks(
    HistoryEntryIsarModel object) {
  return [];
}

void _historyEntryIsarModelAttach(
    IsarCollection<dynamic> col, Id id, HistoryEntryIsarModel object) {
  object.isarId = id;
}

extension HistoryEntryIsarModelByIndex
    on IsarCollection<HistoryEntryIsarModel> {
  Future<HistoryEntryIsarModel?> getById(String id) {
    return getByIndex(r'id', [id]);
  }

  HistoryEntryIsarModel? getByIdSync(String id) {
    return getByIndexSync(r'id', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id', [id]);
  }

  Future<List<HistoryEntryIsarModel?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id', values);
  }

  List<HistoryEntryIsarModel?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'id', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'id', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'id', values);
  }

  Future<Id> putById(HistoryEntryIsarModel object) {
    return putByIndex(r'id', object);
  }

  Id putByIdSync(HistoryEntryIsarModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'id', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<HistoryEntryIsarModel> objects) {
    return putAllByIndex(r'id', objects);
  }

  List<Id> putAllByIdSync(List<HistoryEntryIsarModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'id', objects, saveLinks: saveLinks);
  }
}

extension HistoryEntryIsarModelQueryWhereSort
    on QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QWhere> {
  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HistoryEntryIsarModelQueryWhere on QueryBuilder<HistoryEntryIsarModel,
    HistoryEntryIsarModel, QWhereClause> {
  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterWhereClause>
      idEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterWhereClause>
      idNotEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }
}

extension HistoryEntryIsarModelQueryFilter on QueryBuilder<
    HistoryEntryIsarModel, HistoryEntryIsarModel, QFilterCondition> {
  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> areaInSqFtEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaInSqFt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> areaInSqFtGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'areaInSqFt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> areaInSqFtLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'areaInSqFt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> areaInSqFtBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'areaInSqFt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dimensions',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dimensions',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dimensions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dimensions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dimensions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dimensions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dimensions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dimensions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dimensions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dimensions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dimensions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> dimensionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dimensions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> mapPointCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mapPointCount',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> mapPointCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mapPointCount',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> mapPointCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mapPointCount',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> mapPointCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mapPointCount',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> mapPointCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mapPointCount',
        value: value,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> mapPointCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mapPointCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shapeIndex',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shapeIndex',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shapeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shapeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shapeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shapeIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shapeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shapeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      shapeIndexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shapeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      shapeIndexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shapeIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shapeIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> shapeIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shapeIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> typeIndexEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> typeIndexGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> typeIndexLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> typeIndexBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> typeIndexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'typeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> typeIndexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'typeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      typeIndexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typeIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      typeIndexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typeIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> typeIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> typeIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typeIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> unitIndexEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> unitIndexGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> unitIndexLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> unitIndexBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> unitIndexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> unitIndexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      unitIndexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitIndex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
          QAfterFilterCondition>
      unitIndexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitIndex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> unitIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel,
      QAfterFilterCondition> unitIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitIndex',
        value: '',
      ));
    });
  }
}

extension HistoryEntryIsarModelQueryObject on QueryBuilder<
    HistoryEntryIsarModel, HistoryEntryIsarModel, QFilterCondition> {}

extension HistoryEntryIsarModelQueryLinks on QueryBuilder<HistoryEntryIsarModel,
    HistoryEntryIsarModel, QFilterCondition> {}

extension HistoryEntryIsarModelQuerySortBy
    on QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QSortBy> {
  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByAreaInSqFt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaInSqFt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByAreaInSqFtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaInSqFt', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByMapPointCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapPointCount', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByMapPointCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapPointCount', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByShapeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shapeIndex', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByShapeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shapeIndex', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByTypeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIndex', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByTypeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIndex', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByUnitIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitIndex', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      sortByUnitIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitIndex', Sort.desc);
    });
  }
}

extension HistoryEntryIsarModelQuerySortThenBy
    on QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QSortThenBy> {
  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByAreaInSqFt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaInSqFt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByAreaInSqFtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaInSqFt', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByMapPointCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapPointCount', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByMapPointCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapPointCount', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByShapeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shapeIndex', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByShapeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shapeIndex', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByTypeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIndex', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByTypeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIndex', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByUnitIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitIndex', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QAfterSortBy>
      thenByUnitIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitIndex', Sort.desc);
    });
  }
}

extension HistoryEntryIsarModelQueryWhereDistinct
    on QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct> {
  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByAreaInSqFt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'areaInSqFt');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByDimensions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dimensions');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByMapPointCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mapPointCount');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByShapeIndex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shapeIndex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByTypeIndex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeIndex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryEntryIsarModel, HistoryEntryIsarModel, QDistinct>
      distinctByUnitIndex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitIndex', caseSensitive: caseSensitive);
    });
  }
}

extension HistoryEntryIsarModelQueryProperty on QueryBuilder<
    HistoryEntryIsarModel, HistoryEntryIsarModel, QQueryProperty> {
  QueryBuilder<HistoryEntryIsarModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, double, QQueryOperations>
      areaInSqFtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'areaInSqFt');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, List<double>?, QQueryOperations>
      dimensionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dimensions');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, bool, QQueryOperations>
      isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, String?, QQueryOperations>
      labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, int?, QQueryOperations>
      mapPointCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mapPointCount');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, String?, QQueryOperations>
      shapeIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shapeIndex');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, String, QQueryOperations>
      typeIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeIndex');
    });
  }

  QueryBuilder<HistoryEntryIsarModel, String, QQueryOperations>
      unitIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitIndex');
    });
  }
}
