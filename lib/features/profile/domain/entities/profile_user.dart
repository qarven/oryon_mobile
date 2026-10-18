class ProfileUser {
  const ProfileUser({
    required this.name,
    required this.username,
    required this.email,
    this.avatarUrl,
  });

  final String name;
  final String username;
  final String email;
  final String? avatarUrl;

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }
}
