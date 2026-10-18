import 'package:oryon_mobile/features/profile/domain/entities/profile_user.dart';

abstract interface class ProfileRepository {
  Future<ProfileUser> getCurrentUser();
}
