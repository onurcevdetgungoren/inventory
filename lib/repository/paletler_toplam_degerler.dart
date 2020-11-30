import 'package:cloud_firestore/cloud_firestore.dart';

class PaletlerToplamDeger {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //TOPLAM METRAJ VE TOPLAM BUNDLE ADEDİ
  Future<QuerySnapshot> getToplamRepo() async {
    //Burada doc içindekini dmöndürdüğü için DocumentSnapshot tğüründe döndü, direk collection içindekini döndürse; QuerySnapshot dönecekti
    var snap = await _firestore.collection("Paletlercounters").get();
    print("gelen veri: $snap");
    return snap;
  }
}
