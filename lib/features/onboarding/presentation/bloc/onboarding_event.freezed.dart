// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingPageChanged value)?  pageChanged,TResult Function( OnboardingCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingPageChanged() when pageChanged != null:
return pageChanged(_that);case OnboardingCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingPageChanged value)  pageChanged,required TResult Function( OnboardingCompleted value)  completed,}){
final _that = this;
switch (_that) {
case OnboardingPageChanged():
return pageChanged(_that);case OnboardingCompleted():
return completed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingPageChanged value)?  pageChanged,TResult? Function( OnboardingCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case OnboardingPageChanged() when pageChanged != null:
return pageChanged(_that);case OnboardingCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page)?  pageChanged,TResult Function()?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingPageChanged() when pageChanged != null:
return pageChanged(_that.page);case OnboardingCompleted() when completed != null:
return completed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page)  pageChanged,required TResult Function()  completed,}) {final _that = this;
switch (_that) {
case OnboardingPageChanged():
return pageChanged(_that.page);case OnboardingCompleted():
return completed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page)?  pageChanged,TResult? Function()?  completed,}) {final _that = this;
switch (_that) {
case OnboardingPageChanged() when pageChanged != null:
return pageChanged(_that.page);case OnboardingCompleted() when completed != null:
return completed();case _:
  return null;

}
}

}

/// @nodoc


class OnboardingPageChanged implements OnboardingEvent {
  const OnboardingPageChanged(this.page);
  

 final  int page;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPageChangedCopyWith<OnboardingPageChanged> get copyWith => _$OnboardingPageChangedCopyWithImpl<OnboardingPageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPageChanged&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode {
    return Object.hash(runtimeType,page);
}

@override
String toString() {
    return 'OnboardingEvent.pageChanged(page: $page)';
}


}

/// @nodoc
abstract mixin class $OnboardingPageChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingPageChangedCopyWith(OnboardingPageChanged value, $Res Function(OnboardingPageChanged) _then) = _$OnboardingPageChangedCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class _$OnboardingPageChangedCopyWithImpl<$Res>
    implements $OnboardingPageChangedCopyWith<$Res> {
  _$OnboardingPageChangedCopyWithImpl(this._self, this._then);

  final OnboardingPageChanged _self;
  final $Res Function(OnboardingPageChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(OnboardingPageChanged(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnboardingCompleted implements OnboardingEvent {
  const OnboardingCompleted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingEvent.completed()';
}


}




// dart format on
