// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walkthrough_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalkthroughState {

 int get page; bool get completed;
/// Create a copy of WalkthroughState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalkthroughStateCopyWith<WalkthroughState> get copyWith => _$WalkthroughStateCopyWithImpl<WalkthroughState>(this as WalkthroughState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WalkthroughState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalkthroughState&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.completed, _this.completed) || other.completed == _this.completed));
}


@override
int get hashCode {
  final _this = this as WalkthroughState;
  return Object.hash(runtimeType,_this.page,_this.completed);
}

@override
String toString() {
  final _this = this as WalkthroughState;
  return 'WalkthroughState(page: ${_this.page}, completed: ${_this.completed})';
}


}

/// @nodoc
abstract mixin class $WalkthroughStateCopyWith<$Res>  {
  factory $WalkthroughStateCopyWith(WalkthroughState value, $Res Function(WalkthroughState) _then) = _$WalkthroughStateCopyWithImpl;
@useResult
$Res call({
 int page, bool completed
});




}
/// @nodoc
class _$WalkthroughStateCopyWithImpl<$Res>
    implements $WalkthroughStateCopyWith<$Res> {
  _$WalkthroughStateCopyWithImpl(this._self, this._then);

  final WalkthroughState _self;
  final $Res Function(WalkthroughState) _then;

/// Create a copy of WalkthroughState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? completed = null,}) {
  return _then(WalkthroughState(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WalkthroughState].
extension WalkthroughStatePatterns on WalkthroughState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalkthroughState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalkthroughState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalkthroughState value)  $default,){
final _that = this;
switch (_that) {
case _WalkthroughState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalkthroughState value)?  $default,){
final _that = this;
switch (_that) {
case _WalkthroughState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalkthroughState() when $default != null:
return $default(_that.page,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _WalkthroughState():
return $default(_that.page,_that.completed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _WalkthroughState() when $default != null:
return $default(_that.page,_that.completed);case _:
  return null;

}
}

}

/// @nodoc


class _WalkthroughState implements WalkthroughState {
  const _WalkthroughState({this.page = 0, this.completed = false});
  

@override@JsonKey() final  int page;
@override@JsonKey() final  bool completed;

/// Create a copy of WalkthroughState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalkthroughStateCopyWith<_WalkthroughState> get copyWith => __$WalkthroughStateCopyWithImpl<_WalkthroughState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalkthroughState&&(identical(other.page, page) || other.page == page)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,page,completed);
}

@override
String toString() {
    return 'WalkthroughState(page: $page, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$WalkthroughStateCopyWith<$Res> implements $WalkthroughStateCopyWith<$Res> {
  factory _$WalkthroughStateCopyWith(_WalkthroughState value, $Res Function(_WalkthroughState) _then) = __$WalkthroughStateCopyWithImpl;
@override @useResult
$Res call({
 int page, bool completed
});




}
/// @nodoc
class __$WalkthroughStateCopyWithImpl<$Res>
    implements _$WalkthroughStateCopyWith<$Res> {
  __$WalkthroughStateCopyWithImpl(this._self, this._then);

  final _WalkthroughState _self;
  final $Res Function(_WalkthroughState) _then;

/// Create a copy of WalkthroughState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? completed = null,}) {
  return _then(_WalkthroughState(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
