// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inventory_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventorySearch _$InventorySearchFromJson(Map<String, dynamic> json) {
  return _InventorySearch.fromJson(json);
}

/// @nodoc
mixin _$InventorySearch {
  @JsonKey(name: 'ProductID')
  String get productID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductName')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Locations')
  List<dynamic> get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventorySearchCopyWith<InventorySearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventorySearchCopyWith<$Res> {
  factory $InventorySearchCopyWith(
          InventorySearch value, $Res Function(InventorySearch) then) =
      _$InventorySearchCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ProductID') String productID,
      @JsonKey(name: 'ProductName') String productName,
      @JsonKey(name: 'Locations') List<dynamic> locations});
}

/// @nodoc
class _$InventorySearchCopyWithImpl<$Res>
    implements $InventorySearchCopyWith<$Res> {
  _$InventorySearchCopyWithImpl(this._value, this._then);

  final InventorySearch _value;
  // ignore: unused_field
  final $Res Function(InventorySearch) _then;

  @override
  $Res call({
    Object? productID = freezed,
    Object? productName = freezed,
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      productID: productID == freezed
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_InventorySearchCopyWith<$Res>
    implements $InventorySearchCopyWith<$Res> {
  factory _$$_InventorySearchCopyWith(
          _$_InventorySearch value, $Res Function(_$_InventorySearch) then) =
      __$$_InventorySearchCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ProductID') String productID,
      @JsonKey(name: 'ProductName') String productName,
      @JsonKey(name: 'Locations') List<dynamic> locations});
}

/// @nodoc
class __$$_InventorySearchCopyWithImpl<$Res>
    extends _$InventorySearchCopyWithImpl<$Res>
    implements _$$_InventorySearchCopyWith<$Res> {
  __$$_InventorySearchCopyWithImpl(
      _$_InventorySearch _value, $Res Function(_$_InventorySearch) _then)
      : super(_value, (v) => _then(v as _$_InventorySearch));

  @override
  _$_InventorySearch get _value => super._value as _$_InventorySearch;

  @override
  $Res call({
    Object? productID = freezed,
    Object? productName = freezed,
    Object? locations = freezed,
  }) {
    return _then(_$_InventorySearch(
      productID: productID == freezed
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      locations: locations == freezed
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InventorySearch implements _InventorySearch {
  _$_InventorySearch(
      {@JsonKey(name: 'ProductID') required this.productID,
      @JsonKey(name: 'ProductName') required this.productName,
      @JsonKey(name: 'Locations') required final List<dynamic> locations})
      : _locations = locations;

  factory _$_InventorySearch.fromJson(Map<String, dynamic> json) =>
      _$$_InventorySearchFromJson(json);

  @override
  @JsonKey(name: 'ProductID')
  final String productID;
  @override
  @JsonKey(name: 'ProductName')
  final String productName;
  final List<dynamic> _locations;
  @override
  @JsonKey(name: 'Locations')
  List<dynamic> get locations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  String toString() {
    return 'InventorySearch(productID: $productID, productName: $productName, locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventorySearch &&
            const DeepCollectionEquality().equals(other.productID, productID) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productID),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(_locations));

  @JsonKey(ignore: true)
  @override
  _$$_InventorySearchCopyWith<_$_InventorySearch> get copyWith =>
      __$$_InventorySearchCopyWithImpl<_$_InventorySearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InventorySearchToJson(this);
  }
}

abstract class _InventorySearch implements InventorySearch {
  factory _InventorySearch(
          {@JsonKey(name: 'ProductID') required final String productID,
          @JsonKey(name: 'ProductName') required final String productName,
          @JsonKey(name: 'Locations') required final List<dynamic> locations}) =
      _$_InventorySearch;

  factory _InventorySearch.fromJson(Map<String, dynamic> json) =
      _$_InventorySearch.fromJson;

  @override
  @JsonKey(name: 'ProductID')
  String get productID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ProductName')
  String get productName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Locations')
  List<dynamic> get locations => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InventorySearchCopyWith<_$_InventorySearch> get copyWith =>
      throw _privateConstructorUsedError;
}
