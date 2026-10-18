import 'package:oryon_mobile/features/profile/domain/entities/profile_user.dart';
import 'package:oryon_mobile/features/profile/domain/repositories/profile_repository.dart';

/// Phase 1 stand-in for the real profile data source. Phase 2 swaps this for
/// an implementation backed by `GetCurrentUser`.
class MockProfileRepository implements ProfileRepository {
  const MockProfileRepository();

  @override
  Future<ProfileUser> getCurrentUser() async => const ProfileUser(
    name: 'Ava Carter',
    username: 'avacarter',
    email: 'ava.carter@oryon.com',
  );
}
