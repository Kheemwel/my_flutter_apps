// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amount_splitter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AmountSplitterState {

 SplitterMode get mode; double? get amount; int? get partCount; bool get allowDecimal; bool get equalOnly; List<SplitPart> get manualParts;
/// Create a copy of AmountSplitterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSplitterStateCopyWith<AmountSplitterState> get copyWith => _$AmountSplitterStateCopyWithImpl<AmountSplitterState>(this as AmountSplitterState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AmountSplitterState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterState&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.partCount, _this.partCount) || other.partCount == _this.partCount)&&(identical(other.allowDecimal, _this.allowDecimal) || other.allowDecimal == _this.allowDecimal)&&(identical(other.equalOnly, _this.equalOnly) || other.equalOnly == _this.equalOnly)&&const DeepCollectionEquality().equals(other.manualParts, _this.manualParts));
}


@override
int get hashCode {
  final _this = this as AmountSplitterState;
  return Object.hash(runtimeType,_this.mode,_this.amount,_this.partCount,_this.allowDecimal,_this.equalOnly,const DeepCollectionEquality().hash(_this.manualParts));
}

@override
String toString() {
  final _this = this as AmountSplitterState;
  return 'AmountSplitterState(mode: ${_this.mode}, amount: ${_this.amount}, partCount: ${_this.partCount}, allowDecimal: ${_this.allowDecimal}, equalOnly: ${_this.equalOnly}, manualParts: ${_this.manualParts})';
}


}

/// @nodoc
abstract mixin class $AmountSplitterStateCopyWith<$Res>  {
  factory $AmountSplitterStateCopyWith(AmountSplitterState value, $Res Function(AmountSplitterState) _then) = _$AmountSplitterStateCopyWithImpl;
@useResult
$Res call({
 SplitterMode mode, double? amount, int? partCount, bool allowDecimal, bool equalOnly, List<SplitPart> manualParts
});




}
/// @nodoc
class _$AmountSplitterStateCopyWithImpl<$Res>
    implements $AmountSplitterStateCopyWith<$Res> {
  _$AmountSplitterStateCopyWithImpl(this._self, this._then);

  final AmountSplitterState _self;
  final $Res Function(AmountSplitterState) _then;

/// Create a copy of AmountSplitterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? amount = freezed,Object? partCount = freezed,Object? allowDecimal = null,Object? equalOnly = null,Object? manualParts = null,}) {
  return _then(AmountSplitterState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplitterMode,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,partCount: freezed == partCount ? _self.partCount : partCount // ignore: cast_nullable_to_non_nullable
as int?,allowDecimal: null == allowDecimal ? _self.allowDecimal : allowDecimal // ignore: cast_nullable_to_non_nullable
as bool,equalOnly: null == equalOnly ? _self.equalOnly : equalOnly // ignore: cast_nullable_to_non_nullable
as bool,manualParts: null == manualParts ? _self.manualParts : manualParts // ignore: cast_nullable_to_non_nullable
as List<SplitPart>,
  ));
}

}


/// Adds pattern-matching-related methods to [AmountSplitterState].
extension AmountSplitterStatePatterns on AmountSplitterState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmountSplitterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmountSplitterState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmountSplitterState value)  $default,){
final _that = this;
switch (_that) {
case _AmountSplitterState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmountSplitterState value)?  $default,){
final _that = this;
switch (_that) {
case _AmountSplitterState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SplitterMode mode,  double? amount,  int? partCount,  bool allowDecimal,  bool equalOnly,  List<SplitPart> manualParts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmountSplitterState() when $default != null:
return $default(_that.mode,_that.amount,_that.partCount,_that.allowDecimal,_that.equalOnly,_that.manualParts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SplitterMode mode,  double? amount,  int? partCount,  bool allowDecimal,  bool equalOnly,  List<SplitPart> manualParts)  $default,) {final _that = this;
switch (_that) {
case _AmountSplitterState():
return $default(_that.mode,_that.amount,_that.partCount,_that.allowDecimal,_that.equalOnly,_that.manualParts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SplitterMode mode,  double? amount,  int? partCount,  bool allowDecimal,  bool equalOnly,  List<SplitPart> manualParts)?  $default,) {final _that = this;
switch (_that) {
case _AmountSplitterState() when $default != null:
return $default(_that.mode,_that.amount,_that.partCount,_that.allowDecimal,_that.equalOnly,_that.manualParts);case _:
  return null;

}
}

}

/// @nodoc


class _AmountSplitterState extends AmountSplitterState {
  const _AmountSplitterState({this.mode = SplitterMode.manual, this.amount, this.partCount, this.allowDecimal = false, this.equalOnly = false,  List<SplitPart> manualParts = const <SplitPart>[]}): _manualParts = manualParts,super._();
  

@override@JsonKey() final  SplitterMode mode;
@override final  double? amount;
@override final  int? partCount;
@override@JsonKey() final  bool allowDecimal;
@override@JsonKey() final  bool equalOnly;
 final  List<SplitPart> _manualParts;
@override@JsonKey() List<SplitPart> get manualParts {
  if (_manualParts is EqualUnmodifiableListView) return _manualParts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_manualParts);
}


/// Create a copy of AmountSplitterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmountSplitterStateCopyWith<_AmountSplitterState> get copyWith => __$AmountSplitterStateCopyWithImpl<_AmountSplitterState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmountSplitterState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.partCount, partCount) || other.partCount == partCount)&&(identical(other.allowDecimal, allowDecimal) || other.allowDecimal == allowDecimal)&&(identical(other.equalOnly, equalOnly) || other.equalOnly == equalOnly)&&const DeepCollectionEquality().equals(other.manualParts, _manualParts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,amount,partCount,allowDecimal,equalOnly,const DeepCollectionEquality().hash(_manualParts));
}

@override
String toString() {
    return 'AmountSplitterState(mode: $mode, amount: $amount, partCount: $partCount, allowDecimal: $allowDecimal, equalOnly: $equalOnly, manualParts: $manualParts)';
}


}

/// @nodoc
abstract mixin class _$AmountSplitterStateCopyWith<$Res> implements $AmountSplitterStateCopyWith<$Res> {
  factory _$AmountSplitterStateCopyWith(_AmountSplitterState value, $Res Function(_AmountSplitterState) _then) = __$AmountSplitterStateCopyWithImpl;
@override @useResult
$Res call({
 SplitterMode mode, double? amount, int? partCount, bool allowDecimal, bool equalOnly, List<SplitPart> manualParts
});




}
/// @nodoc
class __$AmountSplitterStateCopyWithImpl<$Res>
    implements _$AmountSplitterStateCopyWith<$Res> {
  __$AmountSplitterStateCopyWithImpl(this._self, this._then);

  final _AmountSplitterState _self;
  final $Res Function(_AmountSplitterState) _then;

/// Create a copy of AmountSplitterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? amount = freezed,Object? partCount = freezed,Object? allowDecimal = null,Object? equalOnly = null,Object? manualParts = null,}) {
  return _then(_AmountSplitterState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplitterMode,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,partCount: freezed == partCount ? _self.partCount : partCount // ignore: cast_nullable_to_non_nullable
as int?,allowDecimal: null == allowDecimal ? _self.allowDecimal : allowDecimal // ignore: cast_nullable_to_non_nullable
as bool,equalOnly: null == equalOnly ? _self.equalOnly : equalOnly // ignore: cast_nullable_to_non_nullable
as bool,manualParts: null == manualParts ? _self._manualParts : manualParts // ignore: cast_nullable_to_non_nullable
as List<SplitPart>,
  ));
}


}

// dart format on
