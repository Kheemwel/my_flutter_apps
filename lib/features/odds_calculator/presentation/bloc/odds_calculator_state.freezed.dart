// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odds_calculator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OddsCalculatorState {

 double get chance;
/// Create a copy of OddsCalculatorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OddsCalculatorStateCopyWith<OddsCalculatorState> get copyWith => _$OddsCalculatorStateCopyWithImpl<OddsCalculatorState>(this as OddsCalculatorState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OddsCalculatorState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OddsCalculatorState&&(identical(other.chance, _this.chance) || other.chance == _this.chance));
}


@override
int get hashCode {
  final _this = this as OddsCalculatorState;
  return Object.hash(runtimeType,_this.chance);
}

@override
String toString() {
  final _this = this as OddsCalculatorState;
  return 'OddsCalculatorState(chance: ${_this.chance})';
}


}

/// @nodoc
abstract mixin class $OddsCalculatorStateCopyWith<$Res>  {
  factory $OddsCalculatorStateCopyWith(OddsCalculatorState value, $Res Function(OddsCalculatorState) _then) = _$OddsCalculatorStateCopyWithImpl;
@useResult
$Res call({
 double chance
});




}
/// @nodoc
class _$OddsCalculatorStateCopyWithImpl<$Res>
    implements $OddsCalculatorStateCopyWith<$Res> {
  _$OddsCalculatorStateCopyWithImpl(this._self, this._then);

  final OddsCalculatorState _self;
  final $Res Function(OddsCalculatorState) _then;

/// Create a copy of OddsCalculatorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chance = null,}) {
  return _then(OddsCalculatorState(
chance: null == chance ? _self.chance : chance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OddsCalculatorState].
extension OddsCalculatorStatePatterns on OddsCalculatorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OddsCalculatorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OddsCalculatorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OddsCalculatorState value)  $default,){
final _that = this;
switch (_that) {
case _OddsCalculatorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OddsCalculatorState value)?  $default,){
final _that = this;
switch (_that) {
case _OddsCalculatorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double chance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OddsCalculatorState() when $default != null:
return $default(_that.chance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double chance)  $default,) {final _that = this;
switch (_that) {
case _OddsCalculatorState():
return $default(_that.chance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double chance)?  $default,) {final _that = this;
switch (_that) {
case _OddsCalculatorState() when $default != null:
return $default(_that.chance);case _:
  return null;

}
}

}

/// @nodoc


class _OddsCalculatorState extends OddsCalculatorState {
  const _OddsCalculatorState({this.chance = 50}): super._();
  

@override@JsonKey() final  double chance;

/// Create a copy of OddsCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OddsCalculatorStateCopyWith<_OddsCalculatorState> get copyWith => __$OddsCalculatorStateCopyWithImpl<_OddsCalculatorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OddsCalculatorState&&(identical(other.chance, chance) || other.chance == chance));
}


@override
int get hashCode {
    return Object.hash(runtimeType,chance);
}

@override
String toString() {
    return 'OddsCalculatorState(chance: $chance)';
}


}

/// @nodoc
abstract mixin class _$OddsCalculatorStateCopyWith<$Res> implements $OddsCalculatorStateCopyWith<$Res> {
  factory _$OddsCalculatorStateCopyWith(_OddsCalculatorState value, $Res Function(_OddsCalculatorState) _then) = __$OddsCalculatorStateCopyWithImpl;
@override @useResult
$Res call({
 double chance
});




}
/// @nodoc
class __$OddsCalculatorStateCopyWithImpl<$Res>
    implements _$OddsCalculatorStateCopyWith<$Res> {
  __$OddsCalculatorStateCopyWithImpl(this._self, this._then);

  final _OddsCalculatorState _self;
  final $Res Function(_OddsCalculatorState) _then;

/// Create a copy of OddsCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chance = null,}) {
  return _then(_OddsCalculatorState(
chance: null == chance ? _self.chance : chance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
