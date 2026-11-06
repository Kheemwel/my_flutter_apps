// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplitPart {

 int get id; int get amount;
/// Create a copy of SplitPart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitPartCopyWith<SplitPart> get copyWith => _$SplitPartCopyWithImpl<SplitPart>(this as SplitPart, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SplitPart;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitPart&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.amount, _this.amount) || other.amount == _this.amount));
}


@override
int get hashCode {
  final _this = this as SplitPart;
  return Object.hash(runtimeType,_this.id,_this.amount);
}

@override
String toString() {
  final _this = this as SplitPart;
  return 'SplitPart(id: ${_this.id}, amount: ${_this.amount})';
}


}

/// @nodoc
abstract mixin class $SplitPartCopyWith<$Res>  {
  factory $SplitPartCopyWith(SplitPart value, $Res Function(SplitPart) _then) = _$SplitPartCopyWithImpl;
@useResult
$Res call({
 int id, int amount
});




}
/// @nodoc
class _$SplitPartCopyWithImpl<$Res>
    implements $SplitPartCopyWith<$Res> {
  _$SplitPartCopyWithImpl(this._self, this._then);

  final SplitPart _self;
  final $Res Function(SplitPart) _then;

/// Create a copy of SplitPart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,}) {
  return _then(SplitPart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SplitPart].
extension SplitPartPatterns on SplitPart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplitPart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplitPart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplitPart value)  $default,){
final _that = this;
switch (_that) {
case _SplitPart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplitPart value)?  $default,){
final _that = this;
switch (_that) {
case _SplitPart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplitPart() when $default != null:
return $default(_that.id,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int amount)  $default,) {final _that = this;
switch (_that) {
case _SplitPart():
return $default(_that.id,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int amount)?  $default,) {final _that = this;
switch (_that) {
case _SplitPart() when $default != null:
return $default(_that.id,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _SplitPart implements SplitPart {
  const _SplitPart({required this.id, required this.amount});
  

@override final  int id;
@override final  int amount;

/// Create a copy of SplitPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplitPartCopyWith<_SplitPart> get copyWith => __$SplitPartCopyWithImpl<_SplitPart>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplitPart&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,amount);
}

@override
String toString() {
    return 'SplitPart(id: $id, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SplitPartCopyWith<$Res> implements $SplitPartCopyWith<$Res> {
  factory _$SplitPartCopyWith(_SplitPart value, $Res Function(_SplitPart) _then) = __$SplitPartCopyWithImpl;
@override @useResult
$Res call({
 int id, int amount
});




}
/// @nodoc
class __$SplitPartCopyWithImpl<$Res>
    implements _$SplitPartCopyWith<$Res> {
  __$SplitPartCopyWithImpl(this._self, this._then);

  final _SplitPart _self;
  final $Res Function(_SplitPart) _then;

/// Create a copy of SplitPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,}) {
  return _then(_SplitPart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
