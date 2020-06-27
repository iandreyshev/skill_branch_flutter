import 'package:FlutterGalleryApp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  User registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception('A user with this name already exists');
    }
  }

  User registerUserByEmail(String fullName, String email) {
    bool hasUserWithSameEmail = users.containsKey(email);

    if (hasUserWithSameEmail) {
      throw Exception("A user with this email already exists");
    }

    return User();
  }

  User registerUserByPhone(String fullName, String phone) {
    if (phone == null || phone.isEmpty) {
      throw Exception('Enter don\'t empty phone number');
    }

    bool isValidPhoneNumber = phone.startsWith('+') && phone.length == 12;
    bool hasUserWithSamePhone = users.containsKey(phone);

    if (hasUserWithSamePhone) {
      throw Exception('A user with this phone already exists');
    }
  }

  User getUserByLogin(String login) => users[login];

  void setFriends(String login, List<User> friends) {
    users[login].addFriends(friends);
  }
}
