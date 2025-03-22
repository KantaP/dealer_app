// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderListModel _$RequestOrderListModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOrderListModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderListModel {
  @JsonKey(name: 'order_side')
  String? get orderSide => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_type')
  String? get digitalassetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'fields')
  dynamic get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderListModelCopyWith<RequestOrderListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderListModelCopyWith<$Res> {
  factory $RequestOrderListModelCopyWith(RequestOrderListModel value,
          $Res Function(RequestOrderListModel) then) =
      _$RequestOrderListModelCopyWithImpl<$Res, RequestOrderListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_side') String? orderSide,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'digitalasset_type') String? digitalassetType,
      @JsonKey(name: 'limit') int limit,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'fields') dynamic fields});
}

/// @nodoc
class _$RequestOrderListModelCopyWithImpl<$Res,
        $Val extends RequestOrderListModel>
    implements $RequestOrderListModelCopyWith<$Res> {
  _$RequestOrderListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderSide = freezed,
    Object? status = freezed,
    Object? digitalassetType = freezed,
    Object? limit = null,
    Object? page = null,
    Object? fields = freezed,
  }) {
    return _then(_value.copyWith(
      orderSide: freezed == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalassetType: freezed == digitalassetType
          ? _value.digitalassetType
          : digitalassetType // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      fields: freezed == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOrderListModelImplCopyWith<$Res>
    implements $RequestOrderListModelCopyWith<$Res> {
  factory _$$RequestOrderListModelImplCopyWith(
          _$RequestOrderListModelImpl value,
          $Res Function(_$RequestOrderListModelImpl) then) =
      __$$RequestOrderListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order_side') String? orderSide,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'digitalasset_type') String? digitalassetType,
      @JsonKey(name: 'limit') int limit,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'fields') dynamic fields});
}

/// @nodoc
class __$$RequestOrderListModelImplCopyWithImpl<$Res>
    extends _$RequestOrderListModelCopyWithImpl<$Res,
        _$RequestOrderListModelImpl>
    implements _$$RequestOrderListModelImplCopyWith<$Res> {
  __$$RequestOrderListModelImplCopyWithImpl(_$RequestOrderListModelImpl _value,
      $Res Function(_$RequestOrderListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderSide = freezed,
    Object? status = freezed,
    Object? digitalassetType = freezed,
    Object? limit = null,
    Object? page = null,
    Object? fields = freezed,
  }) {
    return _then(_$RequestOrderListModelImpl(
      orderSide: freezed == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalassetType: freezed == digitalassetType
          ? _value.digitalassetType
          : digitalassetType // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      fields: freezed == fields ? _value.fields! : fields,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderListModelImpl implements _RequestOrderListModel {
  const _$RequestOrderListModelImpl(
      {@JsonKey(name: 'order_side') this.orderSide = null,
      @JsonKey(name: 'status') this.status = null,
      @JsonKey(name: 'digitalasset_type') this.digitalassetType = null,
      @JsonKey(name: 'limit') this.limit = 100,
      @JsonKey(name: 'page') this.page = 1,
      @JsonKey(name: 'fields') this.fields = const []});

  factory _$RequestOrderListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOrderListModelImplFromJson(json);

  @override
  @JsonKey(name: 'order_side')
  final String? orderSide;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'digitalasset_type')
  final String? digitalassetType;
  @override
  @JsonKey(name: 'limit')
  final int limit;
  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'fields')
  final dynamic fields;

  @override
  String toString() {
    return 'RequestOrderListModel(orderSide: $orderSide, status: $status, digitalassetType: $digitalassetType, limit: $limit, page: $page, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderListModelImpl &&
            (identical(other.orderSide, orderSide) ||
                other.orderSide == orderSide) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.digitalassetType, digitalassetType) ||
                other.digitalassetType == digitalassetType) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.fields, fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderSide,
      status,
      digitalassetType,
      limit,
      page,
      const DeepCollectionEquality().hash(fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderListModelImplCopyWith<_$RequestOrderListModelImpl>
      get copyWith => __$$RequestOrderListModelImplCopyWithImpl<
          _$RequestOrderListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderListModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderListModel implements RequestOrderListModel {
  const factory _RequestOrderListModel(
          {@JsonKey(name: 'order_side') final String? orderSide,
          @JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'digitalasset_type') final String? digitalassetType,
          @JsonKey(name: 'limit') final int limit,
          @JsonKey(name: 'page') final int page,
          @JsonKey(name: 'fields') final dynamic fields}) =
      _$RequestOrderListModelImpl;

  factory _RequestOrderListModel.fromJson(Map<String, dynamic> json) =
      _$RequestOrderListModelImpl.fromJson;

  @override
  @JsonKey(name: 'order_side')
  String? get orderSide;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'digitalasset_type')
  String? get digitalassetType;
  @override
  @JsonKey(name: 'limit')
  int get limit;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'fields')
  dynamic get fields;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderListModelImplCopyWith<_$RequestOrderListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOrderListModel _$ResponseOrderListModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderListModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderListModel {
  @JsonKey(name: 'rows')
  List<ResponseOrderGetModel> get rows => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPage')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRows')
  int get totalRows => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderListModelCopyWith<ResponseOrderListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderListModelCopyWith<$Res> {
  factory $ResponseOrderListModelCopyWith(ResponseOrderListModel value,
          $Res Function(ResponseOrderListModel) then) =
      _$ResponseOrderListModelCopyWithImpl<$Res, ResponseOrderListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rows') List<ResponseOrderGetModel> rows,
      @JsonKey(name: 'currentPage') int currentPage,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'totalRows') int totalRows});
}

/// @nodoc
class _$ResponseOrderListModelCopyWithImpl<$Res,
        $Val extends ResponseOrderListModel>
    implements $ResponseOrderListModelCopyWith<$Res> {
  _$ResponseOrderListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rows = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalRows = null,
  }) {
    return _then(_value.copyWith(
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<ResponseOrderGetModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalRows: null == totalRows
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseOrderListModelImplCopyWith<$Res>
    implements $ResponseOrderListModelCopyWith<$Res> {
  factory _$$ResponseOrderListModelImplCopyWith(
          _$ResponseOrderListModelImpl value,
          $Res Function(_$ResponseOrderListModelImpl) then) =
      __$$ResponseOrderListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rows') List<ResponseOrderGetModel> rows,
      @JsonKey(name: 'currentPage') int currentPage,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'totalRows') int totalRows});
}

/// @nodoc
class __$$ResponseOrderListModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderListModelCopyWithImpl<$Res,
        _$ResponseOrderListModelImpl>
    implements _$$ResponseOrderListModelImplCopyWith<$Res> {
  __$$ResponseOrderListModelImplCopyWithImpl(
      _$ResponseOrderListModelImpl _value,
      $Res Function(_$ResponseOrderListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rows = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalRows = null,
  }) {
    return _then(_$ResponseOrderListModelImpl(
      rows: null == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<ResponseOrderGetModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalRows: null == totalRows
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ResponseOrderListModelImpl implements _ResponseOrderListModel {
  const _$ResponseOrderListModelImpl(
      {@JsonKey(name: 'rows')
      final List<ResponseOrderGetModel> rows = const <ResponseOrderGetModel>[],
      @JsonKey(name: 'currentPage') this.currentPage = 1,
      @JsonKey(name: 'totalPages') this.totalPages = 0,
      @JsonKey(name: 'totalRows') this.totalRows = 0})
      : _rows = rows;

  factory _$ResponseOrderListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseOrderListModelImplFromJson(json);

  final List<ResponseOrderGetModel> _rows;
  @override
  @JsonKey(name: 'rows')
  List<ResponseOrderGetModel> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  @JsonKey(name: 'currentPage')
  final int currentPage;
  @override
  @JsonKey(name: 'totalPages')
  final int totalPages;
  @override
  @JsonKey(name: 'totalRows')
  final int totalRows;

  @override
  String toString() {
    return 'ResponseOrderListModel(rows: $rows, currentPage: $currentPage, totalPages: $totalPages, totalRows: $totalRows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderListModelImpl &&
            const DeepCollectionEquality().equals(other._rows, _rows) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalRows, totalRows) ||
                other.totalRows == totalRows));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rows),
      currentPage,
      totalPages,
      totalRows);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderListModelImplCopyWith<_$ResponseOrderListModelImpl>
      get copyWith => __$$ResponseOrderListModelImplCopyWithImpl<
          _$ResponseOrderListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderListModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderListModel implements ResponseOrderListModel {
  const factory _ResponseOrderListModel(
          {@JsonKey(name: 'rows') final List<ResponseOrderGetModel> rows,
          @JsonKey(name: 'currentPage') final int currentPage,
          @JsonKey(name: 'totalPages') final int totalPages,
          @JsonKey(name: 'totalRows') final int totalRows}) =
      _$ResponseOrderListModelImpl;

  factory _ResponseOrderListModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOrderListModelImpl.fromJson;

  @override
  @JsonKey(name: 'rows')
  List<ResponseOrderGetModel> get rows;
  @override
  @JsonKey(name: 'currentPage')
  int get currentPage;
  @override
  @JsonKey(name: 'totalPages')
  int get totalPages;
  @override
  @JsonKey(name: 'totalRows')
  int get totalRows;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderListModelImplCopyWith<_$ResponseOrderListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
