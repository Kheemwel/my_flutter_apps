// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CounterEvent()';
}


}

/// @nodoc
class $CounterEventCopyWith<$Res>  {
$CounterEventCopyWith(CounterEvent _, $Res Function(CounterEvent) __);
}


/// Adds pattern-matching-related methods to [CounterEvent].
extension CounterEventPatterns on CounterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IncrementPressed value)?  incrementPressed,TResult Function( DecrementPressed value)?  decrementPressed,TResult Function( ResetPressed value)?  resetPressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IncrementPressed() when incrementPressed != null:
return incrementPressed(_that);case DecrementPressed() when decrementPressed != null:
return decrementPressed(_that);case ResetPressed() when resetPressed != null:
return resetPressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IncrementPressed value)  incrementPressed,required TResult Function( DecrementPressed value)  decrementPressed,required TResult Function( ResetPressed value)  resetPressed,}){
final _that = this;
switch (_that) {
case IncrementPressed():
return incrementPressed(_that);case DecrementPressed():
return decrementPressed(_that);case ResetPressed():
return resetPressed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IncrementPressed value)?  incrementPressed,TResult? Function( DecrementPressed value)?  decrementPressed,TResult? Function( ResetPressed value)?  resetPressed,}){
final _that = this;
switch (_that) {
case IncrementPressed() when incrementPressed != null:
return incrementPressed(_that);case DecrementPressed() when decrementPressed != null:
return decrementPressed(_that);case ResetPressed() when resetPressed != null:
return resetPressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  incrementPressed,TResult Function()?  decrementPressed,TResult Function()?  resetPressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IncrementPressed() when incrementPressed != null:
return incrementPressed();case DecrementPressed() when decrementPressed != null:
return decrementPressed();case ResetPressed() when resetPressed != null:
return resetPressed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  incrementPressed,required TResult Function()  decrementPressed,required TResult Function()  resetPressed,}) {final _that = this;
switch (_that) {
case IncrementPressed():
return incrementPressed();case DecrementPressed():
return decrementPressed();case ResetPressed():
return resetPressed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  incrementPressed,TResult? Function()?  decrementPressed,TResult? Function()?  resetPressed,}) {final _that = this;
switch (_that) {
case IncrementPressed() when incrementPressed != null:
return incrementPressed();case DecrementPressed() when decrementPressed != null:
return decrementPressed();case ResetPressed() when resetPressed != null:
return resetPressed();case _:
  return null;

}
}

}

/// @nodoc


class IncrementPressed implements CounterEvent {
  const IncrementPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is IncrementPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CounterEvent.incrementPressed()';
}


}




/// @nodoc


class DecrementPressed implements CounterEvent {
  const DecrementPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DecrementPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CounterEvent.decrementPressed()';
}


}




/// @nodoc


class ResetPressed implements CounterEvent {
  const ResetPressed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CounterEvent.resetPressed()';
}


}




// dart format on
