import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> login(String mail, String password) async {
    var authResult =
        await _auth.signInWithEmailAndPassword(email: mail, password: password);
    User user = authResult.user;
    //Geçici olarak resim ve isim ataması için aşağıdaki kodu yazmıştık, burada tek kullanıcı oldupu için 1 seferlik yapmamız yetti
    //Birden fazla hesap olduğunda create accountun altına bunu mutlaka açmal lazım.
    /*user.updateProfile(
        displayName: "Onur Cevdet",
        photoURL:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrhyjCACzGS8WOSykuOzhPWbzqXAmYF9P7sQ&usqp=CAU");*/
    return user;
  }

  Future<void> logOutRepo() async {
    if (_auth.currentUser != null) {
      await _auth.signOut();
      print("Çıkış Başarılı");
    } else {
      return null;
    }
  }
}
