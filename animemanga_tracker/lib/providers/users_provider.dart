import 'package:animemanga_tracker/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Map<String, List<String>> userFavorites = {
  "favorites": [],
};

class UserDetails {
  String username;
  String email;

  UserDetails({
    this.username = "",
    this.email = "",
  });
  UserDetails copyWith({String? username, String? email}) => UserDetails(
        username: username ?? this.username,
        email: email ?? this.email,
      );
}

class UserNotifier extends StateNotifier<UserDetails> {
  UserNotifier()
      : super(
          UserDetails(),
        );

  void addUser(String username, String email) {
    state = state.copyWith(username: username, email: email);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserDetails>((ref) {
  return UserNotifier();
});
