// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amount_splitter_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AmountSplitterEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AmountSplitterEvent()';
}


}

/// @nodoc
class $AmountSplitterEventCopyWith<$Res>  {
$AmountSplitterEventCopyWith(AmountSplitterEvent _, $Res Function(AmountSplitterEvent) __);
}


/// Adds pattern-matching-related methods to [AmountSplitterEvent].
extension AmountSplitterEventPatterns on AmountSplitterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AmountSplitterModeChanged value)?  modeChanged,TResult Function( AmountSplitterAmountChanged value)?  amountChanged,TResult Function( AmountSplitterPartCountChanged value)?  partCountChanged,TResult Function( AmountSplitterAllowDecimalToggled value)?  allowDecimalToggled,TResult Function( AmountSplitterEqualOnlyToggled value)?  equalOnlyToggled,TResult Function( AmountSplitterSplitRequested value)?  splitRequested,TResult Function( AmountSplitterRemoveRequested value)?  removeRequested,TResult Function( AmountSplitterDivideRequested value)?  divideRequested,TResult Function( AmountSplitterClearRequested value)?  clearRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AmountSplitterModeChanged() when modeChanged != null:
return modeChanged(_that);case AmountSplitterAmountChanged() when amountChanged != null:
return amountChanged(_that);case AmountSplitterPartCountChanged() when partCountChanged != null:
return partCountChanged(_that);case AmountSplitterAllowDecimalToggled() when allowDecimalToggled != null:
return allowDecimalToggled(_that);case AmountSplitterEqualOnlyToggled() when equalOnlyToggled != null:
return equalOnlyToggled(_that);case AmountSplitterSplitRequested() when splitRequested != null:
return splitRequested(_that);case AmountSplitterRemoveRequested() when removeRequested != null:
return removeRequested(_that);case AmountSplitterDivideRequested() when divideRequested != null:
return divideRequested(_that);case AmountSplitterClearRequested() when clearRequested != null:
return clearRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AmountSplitterModeChanged value)  modeChanged,required TResult Function( AmountSplitterAmountChanged value)  amountChanged,required TResult Function( AmountSplitterPartCountChanged value)  partCountChanged,required TResult Function( AmountSplitterAllowDecimalToggled value)  allowDecimalToggled,required TResult Function( AmountSplitterEqualOnlyToggled value)  equalOnlyToggled,required TResult Function( AmountSplitterSplitRequested value)  splitRequested,required TResult Function( AmountSplitterRemoveRequested value)  removeRequested,required TResult Function( AmountSplitterDivideRequested value)  divideRequested,required TResult Function( AmountSplitterClearRequested value)  clearRequested,}){
final _that = this;
switch (_that) {
case AmountSplitterModeChanged():
return modeChanged(_that);case AmountSplitterAmountChanged():
return amountChanged(_that);case AmountSplitterPartCountChanged():
return partCountChanged(_that);case AmountSplitterAllowDecimalToggled():
return allowDecimalToggled(_that);case AmountSplitterEqualOnlyToggled():
return equalOnlyToggled(_that);case AmountSplitterSplitRequested():
return splitRequested(_that);case AmountSplitterRemoveRequested():
return removeRequested(_that);case AmountSplitterDivideRequested():
return divideRequested(_that);case AmountSplitterClearRequested():
return clearRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AmountSplitterModeChanged value)?  modeChanged,TResult? Function( AmountSplitterAmountChanged value)?  amountChanged,TResult? Function( AmountSplitterPartCountChanged value)?  partCountChanged,TResult? Function( AmountSplitterAllowDecimalToggled value)?  allowDecimalToggled,TResult? Function( AmountSplitterEqualOnlyToggled value)?  equalOnlyToggled,TResult? Function( AmountSplitterSplitRequested value)?  splitRequested,TResult? Function( AmountSplitterRemoveRequested value)?  removeRequested,TResult? Function( AmountSplitterDivideRequested value)?  divideRequested,TResult? Function( AmountSplitterClearRequested value)?  clearRequested,}){
final _that = this;
switch (_that) {
case AmountSplitterModeChanged() when modeChanged != null:
return modeChanged(_that);case AmountSplitterAmountChanged() when amountChanged != null:
return amountChanged(_that);case AmountSplitterPartCountChanged() when partCountChanged != null:
return partCountChanged(_that);case AmountSplitterAllowDecimalToggled() when allowDecimalToggled != null:
return allowDecimalToggled(_that);case AmountSplitterEqualOnlyToggled() when equalOnlyToggled != null:
return equalOnlyToggled(_that);case AmountSplitterSplitRequested() when splitRequested != null:
return splitRequested(_that);case AmountSplitterRemoveRequested() when removeRequested != null:
return removeRequested(_that);case AmountSplitterDivideRequested() when divideRequested != null:
return divideRequested(_that);case AmountSplitterClearRequested() when clearRequested != null:
return clearRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SplitterMode mode)?  modeChanged,TResult Function( double? amount)?  amountChanged,TResult Function( int? partCount)?  partCountChanged,TResult Function( bool value)?  allowDecimalToggled,TResult Function( bool value)?  equalOnlyToggled,TResult Function()?  splitRequested,TResult Function( int id)?  removeRequested,TResult Function( int id)?  divideRequested,TResult Function()?  clearRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AmountSplitterModeChanged() when modeChanged != null:
return modeChanged(_that.mode);case AmountSplitterAmountChanged() when amountChanged != null:
return amountChanged(_that.amount);case AmountSplitterPartCountChanged() when partCountChanged != null:
return partCountChanged(_that.partCount);case AmountSplitterAllowDecimalToggled() when allowDecimalToggled != null:
return allowDecimalToggled(_that.value);case AmountSplitterEqualOnlyToggled() when equalOnlyToggled != null:
return equalOnlyToggled(_that.value);case AmountSplitterSplitRequested() when splitRequested != null:
return splitRequested();case AmountSplitterRemoveRequested() when removeRequested != null:
return removeRequested(_that.id);case AmountSplitterDivideRequested() when divideRequested != null:
return divideRequested(_that.id);case AmountSplitterClearRequested() when clearRequested != null:
return clearRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SplitterMode mode)  modeChanged,required TResult Function( double? amount)  amountChanged,required TResult Function( int? partCount)  partCountChanged,required TResult Function( bool value)  allowDecimalToggled,required TResult Function( bool value)  equalOnlyToggled,required TResult Function()  splitRequested,required TResult Function( int id)  removeRequested,required TResult Function( int id)  divideRequested,required TResult Function()  clearRequested,}) {final _that = this;
switch (_that) {
case AmountSplitterModeChanged():
return modeChanged(_that.mode);case AmountSplitterAmountChanged():
return amountChanged(_that.amount);case AmountSplitterPartCountChanged():
return partCountChanged(_that.partCount);case AmountSplitterAllowDecimalToggled():
return allowDecimalToggled(_that.value);case AmountSplitterEqualOnlyToggled():
return equalOnlyToggled(_that.value);case AmountSplitterSplitRequested():
return splitRequested();case AmountSplitterRemoveRequested():
return removeRequested(_that.id);case AmountSplitterDivideRequested():
return divideRequested(_that.id);case AmountSplitterClearRequested():
return clearRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SplitterMode mode)?  modeChanged,TResult? Function( double? amount)?  amountChanged,TResult? Function( int? partCount)?  partCountChanged,TResult? Function( bool value)?  allowDecimalToggled,TResult? Function( bool value)?  equalOnlyToggled,TResult? Function()?  splitRequested,TResult? Function( int id)?  removeRequested,TResult? Function( int id)?  divideRequested,TResult? Function()?  clearRequested,}) {final _that = this;
switch (_that) {
case AmountSplitterModeChanged() when modeChanged != null:
return modeChanged(_that.mode);case AmountSplitterAmountChanged() when amountChanged != null:
return amountChanged(_that.amount);case AmountSplitterPartCountChanged() when partCountChanged != null:
return partCountChanged(_that.partCount);case AmountSplitterAllowDecimalToggled() when allowDecimalToggled != null:
return allowDecimalToggled(_that.value);case AmountSplitterEqualOnlyToggled() when equalOnlyToggled != null:
return equalOnlyToggled(_that.value);case AmountSplitterSplitRequested() when splitRequested != null:
return splitRequested();case AmountSplitterRemoveRequested() when removeRequested != null:
return removeRequested(_that.id);case AmountSplitterDivideRequested() when divideRequested != null:
return divideRequested(_that.id);case AmountSplitterClearRequested() when clearRequested != null:
return clearRequested();case _:
  return null;

}
}

}

/// @nodoc


class AmountSplitterModeChanged implements AmountSplitterEvent {
  const AmountSplitterModeChanged(this.mode);
  

 final  SplitterMode mode;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSplitterModeChangedCopyWith<AmountSplitterModeChanged> get copyWith => _$AmountSplitterModeChangedCopyWithImpl<AmountSplitterModeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterModeChanged&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode);
}

@override
String toString() {
    return 'AmountSplitterEvent.modeChanged(mode: $mode)';
}


}

/// @nodoc
abstract mixin class $AmountSplitterModeChangedCopyWith<$Res> implements $AmountSplitterEventCopyWith<$Res> {
  factory $AmountSplitterModeChangedCopyWith(AmountSplitterModeChanged value, $Res Function(AmountSplitterModeChanged) _then) = _$AmountSplitterModeChangedCopyWithImpl;
@useResult
$Res call({
 SplitterMode mode
});




}
/// @nodoc
class _$AmountSplitterModeChangedCopyWithImpl<$Res>
    implements $AmountSplitterModeChangedCopyWith<$Res> {
  _$AmountSplitterModeChangedCopyWithImpl(this._self, this._then);

  final AmountSplitterModeChanged _self;
  final $Res Function(AmountSplitterModeChanged) _then;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(AmountSplitterModeChanged(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplitterMode,
  ));
}


}

/// @nodoc


class AmountSplitterAmountChanged implements AmountSplitterEvent {
  const AmountSplitterAmountChanged(this.amount);
  

 final  double? amount;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSplitterAmountChangedCopyWith<AmountSplitterAmountChanged> get copyWith => _$AmountSplitterAmountChangedCopyWithImpl<AmountSplitterAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterAmountChanged&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,amount);
}

@override
String toString() {
    return 'AmountSplitterEvent.amountChanged(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $AmountSplitterAmountChangedCopyWith<$Res> implements $AmountSplitterEventCopyWith<$Res> {
  factory $AmountSplitterAmountChangedCopyWith(AmountSplitterAmountChanged value, $Res Function(AmountSplitterAmountChanged) _then) = _$AmountSplitterAmountChangedCopyWithImpl;
@useResult
$Res call({
 double? amount
});




}
/// @nodoc
class _$AmountSplitterAmountChangedCopyWithImpl<$Res>
    implements $AmountSplitterAmountChangedCopyWith<$Res> {
  _$AmountSplitterAmountChangedCopyWithImpl(this._self, this._then);

  final AmountSplitterAmountChanged _self;
  final $Res Function(AmountSplitterAmountChanged) _then;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = freezed,}) {
  return _then(AmountSplitterAmountChanged(
freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class AmountSplitterPartCountChanged implements AmountSplitterEvent {
  const AmountSplitterPartCountChanged(this.partCount);
  

 final  int? partCount;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSplitterPartCountChangedCopyWith<AmountSplitterPartCountChanged> get copyWith => _$AmountSplitterPartCountChangedCopyWithImpl<AmountSplitterPartCountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterPartCountChanged&&(identical(other.partCount, partCount) || other.partCount == partCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,partCount);
}

@override
String toString() {
    return 'AmountSplitterEvent.partCountChanged(partCount: $partCount)';
}


}

/// @nodoc
abstract mixin class $AmountSplitterPartCountChangedCopyWith<$Res> implements $AmountSplitterEventCopyWith<$Res> {
  factory $AmountSplitterPartCountChangedCopyWith(AmountSplitterPartCountChanged value, $Res Function(AmountSplitterPartCountChanged) _then) = _$AmountSplitterPartCountChangedCopyWithImpl;
@useResult
$Res call({
 int? partCount
});




}
/// @nodoc
class _$AmountSplitterPartCountChangedCopyWithImpl<$Res>
    implements $AmountSplitterPartCountChangedCopyWith<$Res> {
  _$AmountSplitterPartCountChangedCopyWithImpl(this._self, this._then);

  final AmountSplitterPartCountChanged _self;
  final $Res Function(AmountSplitterPartCountChanged) _then;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partCount = freezed,}) {
  return _then(AmountSplitterPartCountChanged(
freezed == partCount ? _self.partCount : partCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class AmountSplitterAllowDecimalToggled implements AmountSplitterEvent {
  const AmountSplitterAllowDecimalToggled(this.value);
  

 final  bool value;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSplitterAllowDecimalToggledCopyWith<AmountSplitterAllowDecimalToggled> get copyWith => _$AmountSplitterAllowDecimalToggledCopyWithImpl<AmountSplitterAllowDecimalToggled>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterAllowDecimalToggled&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode {
    return Object.hash(runtimeType,value);
}

@override
String toString() {
    return 'AmountSplitterEvent.allowDecimalToggled(value: $value)';
}


}

/// @nodoc
abstract mixin class $AmountSplitterAllowDecimalToggledCopyWith<$Res> implements $AmountSplitterEventCopyWith<$Res> {
  factory $AmountSplitterAllowDecimalToggledCopyWith(AmountSplitterAllowDecimalToggled value, $Res Function(AmountSplitterAllowDecimalToggled) _then) = _$AmountSplitterAllowDecimalToggledCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$AmountSplitterAllowDecimalToggledCopyWithImpl<$Res>
    implements $AmountSplitterAllowDecimalToggledCopyWith<$Res> {
  _$AmountSplitterAllowDecimalToggledCopyWithImpl(this._self, this._then);

  final AmountSplitterAllowDecimalToggled _self;
  final $Res Function(AmountSplitterAllowDecimalToggled) _then;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(AmountSplitterAllowDecimalToggled(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AmountSplitterEqualOnlyToggled implements AmountSplitterEvent {
  const AmountSplitterEqualOnlyToggled(this.value);
  

 final  bool value;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSplitterEqualOnlyToggledCopyWith<AmountSplitterEqualOnlyToggled> get copyWith => _$AmountSplitterEqualOnlyToggledCopyWithImpl<AmountSplitterEqualOnlyToggled>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterEqualOnlyToggled&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode {
    return Object.hash(runtimeType,value);
}

@override
String toString() {
    return 'AmountSplitterEvent.equalOnlyToggled(value: $value)';
}


}

/// @nodoc
abstract mixin class $AmountSplitterEqualOnlyToggledCopyWith<$Res> implements $AmountSplitterEventCopyWith<$Res> {
  factory $AmountSplitterEqualOnlyToggledCopyWith(AmountSplitterEqualOnlyToggled value, $Res Function(AmountSplitterEqualOnlyToggled) _then) = _$AmountSplitterEqualOnlyToggledCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$AmountSplitterEqualOnlyToggledCopyWithImpl<$Res>
    implements $AmountSplitterEqualOnlyToggledCopyWith<$Res> {
  _$AmountSplitterEqualOnlyToggledCopyWithImpl(this._self, this._then);

  final AmountSplitterEqualOnlyToggled _self;
  final $Res Function(AmountSplitterEqualOnlyToggled) _then;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(AmountSplitterEqualOnlyToggled(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AmountSplitterSplitRequested implements AmountSplitterEvent {
  const AmountSplitterSplitRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterSplitRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AmountSplitterEvent.splitRequested()';
}


}




/// @nodoc


class AmountSplitterRemoveRequested implements AmountSplitterEvent {
  const AmountSplitterRemoveRequested(this.id);
  

 final  int id;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSplitterRemoveRequestedCopyWith<AmountSplitterRemoveRequested> get copyWith => _$AmountSplitterRemoveRequestedCopyWithImpl<AmountSplitterRemoveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterRemoveRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'AmountSplitterEvent.removeRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $AmountSplitterRemoveRequestedCopyWith<$Res> implements $AmountSplitterEventCopyWith<$Res> {
  factory $AmountSplitterRemoveRequestedCopyWith(AmountSplitterRemoveRequested value, $Res Function(AmountSplitterRemoveRequested) _then) = _$AmountSplitterRemoveRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$AmountSplitterRemoveRequestedCopyWithImpl<$Res>
    implements $AmountSplitterRemoveRequestedCopyWith<$Res> {
  _$AmountSplitterRemoveRequestedCopyWithImpl(this._self, this._then);

  final AmountSplitterRemoveRequested _self;
  final $Res Function(AmountSplitterRemoveRequested) _then;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(AmountSplitterRemoveRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AmountSplitterDivideRequested implements AmountSplitterEvent {
  const AmountSplitterDivideRequested(this.id);
  

 final  int id;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSplitterDivideRequestedCopyWith<AmountSplitterDivideRequested> get copyWith => _$AmountSplitterDivideRequestedCopyWithImpl<AmountSplitterDivideRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterDivideRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'AmountSplitterEvent.divideRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $AmountSplitterDivideRequestedCopyWith<$Res> implements $AmountSplitterEventCopyWith<$Res> {
  factory $AmountSplitterDivideRequestedCopyWith(AmountSplitterDivideRequested value, $Res Function(AmountSplitterDivideRequested) _then) = _$AmountSplitterDivideRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$AmountSplitterDivideRequestedCopyWithImpl<$Res>
    implements $AmountSplitterDivideRequestedCopyWith<$Res> {
  _$AmountSplitterDivideRequestedCopyWithImpl(this._self, this._then);

  final AmountSplitterDivideRequested _self;
  final $Res Function(AmountSplitterDivideRequested) _then;

/// Create a copy of AmountSplitterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(AmountSplitterDivideRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AmountSplitterClearRequested implements AmountSplitterEvent {
  const AmountSplitterClearRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSplitterClearRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AmountSplitterEvent.clearRequested()';
}


}




// dart format on
