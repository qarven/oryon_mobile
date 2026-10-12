// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_register_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyRegisterEvent {

 String get flowId; String get code; bool get viaPhone;
/// Create a copy of VerifyRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyRegisterEventCopyWith<VerifyRegisterEvent> get copyWith => _$VerifyRegisterEventCopyWithImpl<VerifyRegisterEvent>(this as VerifyRegisterEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VerifyRegisterEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyRegisterEvent&&(identical(other.flowId, _this.flowId) || other.flowId == _this.flowId)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.viaPhone, _this.viaPhone) || other.viaPhone == _this.viaPhone));
}


@override
int get hashCode {
  final _this = this as VerifyRegisterEvent;
  return Object.hash(runtimeType,_this.flowId,_this.code,_this.viaPhone);
}

@override
String toString() {
  final _this = this as VerifyRegisterEvent;
  return 'VerifyRegisterEvent(flowId: ${_this.flowId}, code: ${_this.code}, viaPhone: ${_this.viaPhone})';
}


}

/// @nodoc
abstract mixin class $VerifyRegisterEventCopyWith<$Res>  {
  factory $VerifyRegisterEventCopyWith(VerifyRegisterEvent value, $Res Function(VerifyRegisterEvent) _then) = _$VerifyRegisterEventCopyWithImpl;
@useResult
$Res call({
 String flowId, String code, bool viaPhone
});




}
/// @nodoc
class _$VerifyRegisterEventCopyWithImpl<$Res>
    implements $VerifyRegisterEventCopyWith<$Res> {
  _$VerifyRegisterEventCopyWithImpl(this._self, this._then);

  final VerifyRegisterEvent _self;
  final $Res Function(VerifyRegisterEvent) _then;

/// Create a copy of VerifyRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flowId = null,Object? code = null,Object? viaPhone = null,}) {
  return _then(VerifyRegisterEvent.submitted(
flowId: null == flowId ? _self.flowId : flowId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,viaPhone: null == viaPhone ? _self.viaPhone : viaPhone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyRegisterEvent].
extension VerifyRegisterEventPatterns on VerifyRegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VerifyRegisterSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VerifyRegisterSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VerifyRegisterSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case VerifyRegisterSubmitted():
return submitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VerifyRegisterSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case VerifyRegisterSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String flowId,  String code,  bool viaPhone)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VerifyRegisterSubmitted() when submitted != null:
return submitted(_that.flowId,_that.code,_that.viaPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String flowId,  String code,  bool viaPhone)  submitted,}) {final _that = this;
switch (_that) {
case VerifyRegisterSubmitted():
return submitted(_that.flowId,_that.code,_that.viaPhone);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String flowId,  String code,  bool viaPhone)?  submitted,}) {final _that = this;
switch (_that) {
case VerifyRegisterSubmitted() when submitted != null:
return submitted(_that.flowId,_that.code,_that.viaPhone);case _:
  return null;

}
}

}

/// @nodoc


class VerifyRegisterSubmitted implements VerifyRegisterEvent {
  const VerifyRegisterSubmitted({required this.flowId, required this.code, required this.viaPhone});
  

@override final  String flowId;
@override final  String code;
@override final  bool viaPhone;

/// Create a copy of VerifyRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyRegisterSubmittedCopyWith<VerifyRegisterSubmitted> get copyWith => _$VerifyRegisterSubmittedCopyWithImpl<VerifyRegisterSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyRegisterSubmitted&&(identical(other.flowId, flowId) || other.flowId == flowId)&&(identical(other.code, code) || other.code == code)&&(identical(other.viaPhone, viaPhone) || other.viaPhone == viaPhone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,flowId,code,viaPhone);
}

@override
String toString() {
    return 'VerifyRegisterEvent.submitted(flowId: $flowId, code: $code, viaPhone: $viaPhone)';
}


}

/// @nodoc
abstract mixin class $VerifyRegisterSubmittedCopyWith<$Res> implements $VerifyRegisterEventCopyWith<$Res> {
  factory $VerifyRegisterSubmittedCopyWith(VerifyRegisterSubmitted value, $Res Function(VerifyRegisterSubmitted) _then) = _$VerifyRegisterSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String flowId, String code, bool viaPhone
});




}
/// @nodoc
class _$VerifyRegisterSubmittedCopyWithImpl<$Res>
    implements $VerifyRegisterSubmittedCopyWith<$Res> {
  _$VerifyRegisterSubmittedCopyWithImpl(this._self, this._then);

  final VerifyRegisterSubmitted _self;
  final $Res Function(VerifyRegisterSubmitted) _then;

/// Create a copy of VerifyRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flowId = null,Object? code = null,Object? viaPhone = null,}) {
  return _then(VerifyRegisterSubmitted(
flowId: null == flowId ? _self.flowId : flowId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,viaPhone: null == viaPhone ? _self.viaPhone : viaPhone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
