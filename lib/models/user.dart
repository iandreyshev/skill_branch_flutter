import '../string_utils.dart';

enum LoginType { email, phone }

class User {
  String email;
  String phone;

  String _firstName;
  String _lastName;
  LoginType _loginType;

  List<User> _friends;

  User._({String firstName, String lastName, String phone, String email})
      : _firstName = firstName,
        _lastName = lastName,
        this.phone = phone,
        this.email = email {
    print('User is created');
    _loginType = email != null ? LoginType.email : LoginType.phone;
  }

  factory User({String name, String phone, String email}) {
    if (name.isEmpty) throw Exception('User name is empty');
    if (phone.isEmpty || email.isEmpty)
      throw Exception('phone or email is empty');

    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        email: checkEmail(email),
        phone: chechPhone(phone));
  }

  String get login => _loginType == LoginType.email ? email : phone;
  String get name => '$_firstName $_lastName';
  List<User> get friends => friends;

  static String _getFirstName(String name) => name.split(' ')[0];
  static String _getLastName(String name) => name.split(' ')[1];

  static String checkEmail(String email) {
    if (email == null || email.isEmpty) {
      throw Exception('Enter don\'t empty phone number');
    }

    return email;
  }

  static String chechPhone(String phone) {
    String pattern = r'^(?:[+0])[0-9]{11}';

    phone = phone.replaceAll(RegExp('[^+\\d]'), '');

    if (phone == null || phone.isEmpty) {
      throw Exception('Enter don\'t empty phone number');
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          "Enter a valid phone number starting with a + and containing 11 digits");
    }

    return phone;
  }

  void addFriend(User friend) {
    _friends.add(friend);
  }

  void addFriends(Iterable<User> friends) {
    _friends.addAll(friends);
  }

  void removeFriend(User friend) {
    _friends.remove(friend);
  }

  @override
  bool operator ==(Object object) {
    if (object == null) {
      return false;
    }

    if (object is User) {
      return _firstName == object._firstName &&
      _lastName == object._lastName &&
      (phone == object.phone || email == object.email);
    }
  }
}
