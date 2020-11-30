import 'package:flutter/cupertino.dart';
import 'package:inventory/repository/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../locator.dart';

enum LoginState { InitialState, LoadedState, LoadingState, ErrorState }

class LoginViewModel with ChangeNotifier {
  LoginState _state;
  FirebaseLogin _firebaseLogin = locator<FirebaseLogin>();
  //_state i get ve set yaptık
  User _user;
  LoginState get state => _state;
  set state(LoginState value) {
    _state = value;
    //Bir atama yaptığımız  için notifyListener koyuyorz.
    notifyListeners();
  }

  User get user => _user;
  set user(User value) {
    _user = value;
  }

  LoginViewModel() {
    state = LoginState.InitialState;
    //Başlangıçta State initiale aldık
  }

  Future<User> signInViewModel(String mail, String password) async {
    try {
      state = LoginState.LoadingState;
      print("loading");
      _user = await _firebaseLogin.login(mail, password);
      state = LoginState.LoadedState;
      print("login oldu");
    } catch (e) {
      state = LoginState.ErrorState;
    }
    return _user;
  }

  Future<void> logOutViewModel() async {
    await _firebaseLogin.logOutRepo();
  }
}
