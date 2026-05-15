/// Pure Domain Entity representing a User.
/// It doesn't contain any JSON serialization logic or database IDs.
class User {
  final String id;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });
}
