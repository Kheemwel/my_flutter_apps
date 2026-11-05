// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odds_calculator_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OddsCalculatorEvent {

 double get chance;
/// Create a copy of OddsCalculatorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OddsCalculatorEventCopyWith<OddsCalculatorEvent> get copyWith => _$OddsCalculatorEventCopyWithImpl<OddsCalculatorEvent>(this as OddsCalculatorEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OddsCalculatorEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OddsCalculatorEvent&&(identical(other.chance, _this.chance) || other.chance == _this.chance));
}


@override
int get hashCode {
  final _this = this as OddsCalculatorEvent;
  return Object.hash(runtimeType,_this.chance);
}

@override
String toString() {
  final _this = this as OddsCalculatorEvent;
  return 'OddsCalculatorEvent(chance: ${_this.chance})';
}


}

/// @nodoc
abstract mixin class $OddsCalculatorEventCopyWith<$Res>  {
  factory $OddsCalculatorEventCopyWith(OddsCalculatorEvent value, $Res Function(OddsCalculatorEvent) _then) = _$OddsCalculatorEventCopyWithImpl;
@useResult
$Res call({
 double chance
});




}
/// @nodoc
class _$OddsCalculatorEventCopyWithImpl<$Res>
    implements $OddsCalculatorEventCopyWith<$Res> {
  _$OddsCalculatorEventCopyWithImpl(this._self, this._then);

  final OddsCalculatorEvent _self;
  final $Res Function(OddsCalculatorEvent) _then;

/// Create a copy of OddsCalculatorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chance = null,}) {
  return _then(OddsCalculatorEvent.chanceChanged(
null == chance ? _self.chance : chance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OddsCalculatorEvent].
extension OddsCalculatorEventPatterns on OddsCalculatorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChanceChanged value)?  chanceChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChanceChanged() when chanceChanged != null:
return chanceChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChanceChanged value)  chanceChanged,}){
final _that = this;
switch (_that) {
case ChanceChanged():
return chanceChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChanceChanged value)?  chanceChanged,}){
final _that = this;
switch (_that) {
case ChanceChanged() when chanceChanged != null:
return chanceChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double chance)?  chanceChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChanceChanged() when chanceChanged != null:
return chanceChanged(_that.chance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double chance)  chanceChanged,}) {final _that = this;
switch (_that) {
case ChanceChanged():
return chanceChanged(_that.chance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double chance)?  chanceChanged,}) {final _that = this;
switch (_that) {
case ChanceChanged() when chanceChanged != null:
return chanceChanged(_that.chance);case _:
  return null;

}
}

}

/// @nodoc


class ChanceChanged implements OddsCalculatorEvent {
  const ChanceChanged(this.chance);
  

@override final  double chance;

/// Create a copy of OddsCalculatorEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChanceChangedCopyWith<ChanceChanged> get copyWith => _$ChanceChangedCopyWithImpl<ChanceChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ChanceChanged&&(identical(other.chance, chance) || other.chance == chance));
}


@override
int get hashCode {
    return Object.hash(runtimeType,chance);
}

@override
String toString() {
    return 'OddsCalculatorEvent.chanceChanged(chance: $chance)';
}


}

/// @nodoc
abstract mixin class $ChanceChangedCopyWith<$Res> implements $OddsCalculatorEventCopyWith<$Res> {
  factory $ChanceChangedCopyWith(ChanceChanged value, $Res Function(ChanceChanged) _then) = _$ChanceChangedCopyWithImpl;
@override @useResult
$Res call({
 double chance
});




}
/// @nodoc
class _$ChanceChangedCopyWithImpl<$Res>
    implements $ChanceChangedCopyWith<$Res> {
  _$ChanceChangedCopyWithImpl(this._self, this._then);

  final ChanceChanged _self;
  final $Res Function(ChanceChanged) _then;

/// Create a copy of OddsCalculatorEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chance = null,}) {
  return _then(ChanceChanged(
null == chance ? _self.chance : chance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
