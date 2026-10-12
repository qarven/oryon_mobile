// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyRegisterState {

 VerifyRegisterStatus get status; Object? get error;
/// Create a copy of VerifyRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyRegisterStateCopyWith<VerifyRegisterState> get copyWith => _$VerifyRegisterStateCopyWithImpl<VerifyRegisterState>(this as VerifyRegisterState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VerifyRegisterState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyRegisterState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.error, _this.error));
}


@override
int get hashCode {
  final _this = this as VerifyRegisterState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.error));
}

@override
String toString() {
  final _this = this as VerifyRegisterState;
  return 'VerifyRegisterState(status: ${_this.status}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $VerifyRegisterStateCopyWith<$Res>  {
  factory $VerifyRegisterStateCopyWith(VerifyRegisterState value, $Res Function(VerifyRegisterState) _then) = _$VerifyRegisterStateCopyWithImpl;
@useResult
$Res call({
 VerifyRegisterStatus status, Object? error
});




}
/// @nodoc
class _$VerifyRegisterStateCopyWithImpl<$Res>
    implements $VerifyRegisterStateCopyWith<$Res> {
  _$VerifyRegisterStateCopyWithImpl(this._self, this._then);

  final VerifyRegisterState _self;
  final $Res Function(VerifyRegisterState) _then;

/// Create a copy of VerifyRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? error = freezed,}) {
  return _then(VerifyRegisterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VerifyRegisterStatus,error: freezed == error ? _self.error : error ,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyRegisterState].
extension VerifyRegisterStatePatterns on VerifyRegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyRegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyRegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyRegisterState value)  $default,){
final _that = this;
switch (_that) {
case _VerifyRegisterState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyRegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyRegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VerifyRegisterStatus status,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyRegisterState() when $default != null:
return $default(_that.status,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VerifyRegisterStatus status,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _VerifyRegisterState():
return $default(_that.status,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VerifyRegisterStatus status,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _VerifyRegisterState() when $default != null:
return $default(_that.status,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyRegisterState implements VerifyRegisterState {
  const _VerifyRegisterState({this.status = VerifyRegisterStatus.idle, this.error = null});
  

@override@JsonKey() final  VerifyRegisterStatus status;
@override@JsonKey() final  Object? error;

/// Create a copy of VerifyRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyRegisterStateCopyWith<_VerifyRegisterState> get copyWith => __$VerifyRegisterStateCopyWithImpl<_VerifyRegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyRegisterState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(error));
}

@override
String toString() {
    return 'VerifyRegisterState(status: $status, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VerifyRegisterStateCopyWith<$Res> implements $VerifyRegisterStateCopyWith<$Res> {
  factory _$VerifyRegisterStateCopyWith(_VerifyRegisterState value, $Res Function(_VerifyRegisterState) _then) = __$VerifyRegisterStateCopyWithImpl;
@override @useResult
$Res call({
 VerifyRegisterStatus status, Object? error
});




}
/// @nodoc
class __$VerifyRegisterStateCopyWithImpl<$Res>
    implements _$VerifyRegisterStateCopyWith<$Res> {
  __$VerifyRegisterStateCopyWithImpl(this._self, this._then);

  final _VerifyRegisterState _self;
  final $Res Function(_VerifyRegisterState) _then;

/// Create a copy of VerifyRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? error = freezed,}) {
  return _then(_VerifyRegisterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VerifyRegisterStatus,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
