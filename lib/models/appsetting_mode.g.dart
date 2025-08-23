// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appsetting_mode.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppsettingModeCollection on Isar {
  IsarCollection<AppsettingMode> get appsettingModes => this.collection();
}

const AppsettingModeSchema = CollectionSchema(
  name: r'AppsettingMode',
  id: 6124346386491781165,
  properties: {
    r'firstlaunch': PropertySchema(
      id: 0,
      name: r'firstlaunch',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _appsettingModeEstimateSize,
  serialize: _appsettingModeSerialize,
  deserialize: _appsettingModeDeserialize,
  deserializeProp: _appsettingModeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appsettingModeGetId,
  getLinks: _appsettingModeGetLinks,
  attach: _appsettingModeAttach,
  version: '3.1.0+1',
);

int _appsettingModeEstimateSize(
  AppsettingMode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _appsettingModeSerialize(
  AppsettingMode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.firstlaunch);
}

AppsettingMode _appsettingModeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppsettingMode();
  object.firstlaunch = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _appsettingModeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appsettingModeGetId(AppsettingMode object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appsettingModeGetLinks(AppsettingMode object) {
  return [];
}

void _appsettingModeAttach(
    IsarCollection<dynamic> col, Id id, AppsettingMode object) {
  object.id = id;
}

extension AppsettingModeQueryWhereSort
    on QueryBuilder<AppsettingMode, AppsettingMode, QWhere> {
  QueryBuilder<AppsettingMode, AppsettingMode, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppsettingModeQueryWhere
    on QueryBuilder<AppsettingMode, AppsettingMode, QWhereClause> {
  QueryBuilder<AppsettingMode, AppsettingMode, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppsettingModeQueryFilter
    on QueryBuilder<AppsettingMode, AppsettingMode, QFilterCondition> {
  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition>
      firstlaunchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstlaunch',
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition>
      firstlaunchIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstlaunch',
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition>
      firstlaunchEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstlaunch',
        value: value,
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition>
      firstlaunchGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstlaunch',
        value: value,
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition>
      firstlaunchLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstlaunch',
        value: value,
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition>
      firstlaunchBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstlaunch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppsettingModeQueryObject
    on QueryBuilder<AppsettingMode, AppsettingMode, QFilterCondition> {}

extension AppsettingModeQueryLinks
    on QueryBuilder<AppsettingMode, AppsettingMode, QFilterCondition> {}

extension AppsettingModeQuerySortBy
    on QueryBuilder<AppsettingMode, AppsettingMode, QSortBy> {
  QueryBuilder<AppsettingMode, AppsettingMode, QAfterSortBy>
      sortByFirstlaunch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstlaunch', Sort.asc);
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterSortBy>
      sortByFirstlaunchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstlaunch', Sort.desc);
    });
  }
}

extension AppsettingModeQuerySortThenBy
    on QueryBuilder<AppsettingMode, AppsettingMode, QSortThenBy> {
  QueryBuilder<AppsettingMode, AppsettingMode, QAfterSortBy>
      thenByFirstlaunch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstlaunch', Sort.asc);
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterSortBy>
      thenByFirstlaunchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstlaunch', Sort.desc);
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppsettingMode, AppsettingMode, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AppsettingModeQueryWhereDistinct
    on QueryBuilder<AppsettingMode, AppsettingMode, QDistinct> {
  QueryBuilder<AppsettingMode, AppsettingMode, QDistinct>
      distinctByFirstlaunch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstlaunch');
    });
  }
}

extension AppsettingModeQueryProperty
    on QueryBuilder<AppsettingMode, AppsettingMode, QQueryProperty> {
  QueryBuilder<AppsettingMode, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppsettingMode, DateTime?, QQueryOperations>
      firstlaunchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstlaunch');
    });
  }
}
