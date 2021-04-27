import 'package:nid_notes/models/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();

class UserBloc {
  User? currentUser;
  // final _login = PublishSubject<User>();
  // Stream<User> get loginStream => _login.stream;

  Future<void> init() async {
    String? username = await storage.read(key: 'token');
    if (username != null) {
      currentUser = User(username);
    }
  }

  Future<bool> login(User user) async {
    if (user.username == "test" && user.password == "test") {

      await storage.write(key: 'username', value: user.username);
      await storage.write(key: 'token', value: 'tokenDiProva');
      this.currentUser = user;
      // _login.sink.add(loggedUser);
      return true;
    }
    return false;
  }

  void logout() async {
    this.currentUser = null;
    await storage.delete(key: 'username');
    await storage.delete(key: 'token');
    // _login.sink.add(null);
  }

  dispose() {
    // _login.close();
  }

}

final userBloc = UserBloc();