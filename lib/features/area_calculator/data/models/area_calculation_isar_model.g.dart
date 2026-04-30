// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_calculation_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAreaCalculationIsarModelCollection on Isar {
  IsarCollection<AreaCalculationIsarModel> get areaCalculationIsarModels =>
      this.collection();
}

const AreaCalculationIsarModelSchema = CollectionSchema(
  name: r'AreaCalculationIsarModel',
  id: 3277406197776244797,
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
    r'shapeIndex': PropertySchema(
      id: 6,
      name: r'shapeIndex',
      type: IsarType.string,
    ),
    r'unitIndex': PropertySchema(
      id: 7,
      name: r'unitIndex',
      type: IsarType.string,
    )
  },
  estimateSize: _areaCalculationIsarModelEstimateSize,
  serialize: _areaCalculationIsarModelSerialize,
  deserialize: _areaCalculationIsarModelDeserialize,
  deserializeProp: _areaCalculationIsarModelDeserializeProp,
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
  getId: _areaCalculationIsarModelGetId,
  getLinks: _areaCalculationIsarModelGetLinks,
  attach: _areaCalculationIsarModelAttach,
  version: '3.1.0+1',
);

int _areaCalculationIsarModelEstimateSize(
  AreaCalculationIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dimensions.length * 8;
  bytesCount += 3 + object.id.length * 3;
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.shapeIndex.length * 3;
  bytesCount += 3 + object.unitIndex.length * 3;
  return bytesCount;
}

void _areaCalculationIsarModelSerialize(
  AreaCalculationIsarModel object,
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
  writer.writeString(offsets[6], object.shapeIndex);
  writer.writeString(offsets[7], object.unitIndex);
}

AreaCalculationIsarModel _areaCalculationIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AreaCalculationIsarModel();
  object.areaInSqFt = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.dimensions = reader.readDoubleList(offsets[2]) ?? [];
  object.id = reader.readString(offsets[3]);
  object.isFavorite = reader.readBool(offsets[4]);
  object.isarId = id;
  object.label = reader.readStringOrNull(offsets[5]);
  object.shapeIndex = reader.readString(offsets[6]);
  object.unitIndex = reader.readString(offsets[7]);
  return object;
}

P _areaCalculationIsarModelDeserializeProp<P>(
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
      return (reader.readDoubleList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _areaCalculationIsarModelGetId(AreaCalculationIsarModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _areaCalculationIsarModelGetLinks(
    AreaCalculationIsarModel object) {
  return [];
}

void _areaCalculationIsarModelAttach(
    IsarCollection<dynamic> col, Id id, AreaCalculationIsarModel object) {
  object.isarId = id;
}

extension AreaCalculationIsarModelByIndex
    on IsarCollection<AreaCalculationIsarModel> {
  Future<AreaCalculationIsarModel?> getById(String id) {
    return getByIndex(r'id', [id]);
  }

  AreaCalculationIsarModel? getByIdSync(String id) {
    return getByIndexSync(r'id', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id', [id]);
  }

  Future<List<AreaCalculationIsarModel?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id', values);
  }

  List<AreaCalculationIsarModel?> getAllByIdSync(List<String> idValues) {
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

  Future<Id> putById(AreaCalculationIsarModel object) {
    return putByIndex(r'id', object);
  }

  Id putByIdSync(AreaCalculationIsarModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'id', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<AreaCalculationIsarModel> objects) {
    return putAllByIndex(r'id', objects);
  }

  List<Id> putAllByIdSync(List<AreaCalculationIsarModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'id', objects, saveLinks: saveLinks);
  }
}

extension AreaCalculationIsarModelQueryWhereSort on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QWhere> {
  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AreaCalculationIsarModelQueryWhere on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QWhereClause> {
  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterWhereClause> idEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterWhereClause> idNotEqualTo(String id) {
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

extension AreaCalculationIsarModelQueryFilter on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QFilterCondition> {
  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> shapeIndexEqualTo(
    String value, {
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> shapeIndexGreaterThan(
    String value, {
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> shapeIndexLessThan(
    String value, {
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> shapeIndexBetween(
    String lower,
    String upper, {
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> shapeIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shapeIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> shapeIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shapeIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
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

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> unitIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitIndex',
        value: '',
      ));
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel,
      QAfterFilterCondition> unitIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitIndex',
        value: '',
      ));
    });
  }
}

extension AreaCalculationIsarModelQueryObject on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QFilterCondition> {}

extension AreaCalculationIsarModelQueryLinks on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QFilterCondition> {}

extension AreaCalculationIsarModelQuerySortBy on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QSortBy> {
  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByAreaInSqFt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaInSqFt', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByAreaInSqFtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaInSqFt', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByShapeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shapeIndex', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByShapeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shapeIndex', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByUnitIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitIndex', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      sortByUnitIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitIndex', Sort.desc);
    });
  }
}

extension AreaCalculationIsarModelQuerySortThenBy on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QSortThenBy> {
  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByAreaInSqFt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaInSqFt', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByAreaInSqFtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaInSqFt', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByShapeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shapeIndex', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByShapeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shapeIndex', Sort.desc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByUnitIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitIndex', Sort.asc);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QAfterSortBy>
      thenByUnitIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitIndex', Sort.desc);
    });
  }
}

extension AreaCalculationIsarModelQueryWhereDistinct on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct> {
  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct>
      distinctByAreaInSqFt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'areaInSqFt');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct>
      distinctByDimensions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dimensions');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct>
      distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct>
      distinctByLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct>
      distinctByShapeIndex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shapeIndex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AreaCalculationIsarModel, AreaCalculationIsarModel, QDistinct>
      distinctByUnitIndex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitIndex', caseSensitive: caseSensitive);
    });
  }
}

extension AreaCalculationIsarModelQueryProperty on QueryBuilder<
    AreaCalculationIsarModel, AreaCalculationIsarModel, QQueryProperty> {
  QueryBuilder<AreaCalculationIsarModel, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, double, QQueryOperations>
      areaInSqFtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'areaInSqFt');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, List<double>, QQueryOperations>
      dimensionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dimensions');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, String, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, bool, QQueryOperations>
      isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, String?, QQueryOperations>
      labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, String, QQueryOperations>
      shapeIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shapeIndex');
    });
  }

  QueryBuilder<AreaCalculationIsarModel, String, QQueryOperations>
      unitIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitIndex');
    });
  }
}
