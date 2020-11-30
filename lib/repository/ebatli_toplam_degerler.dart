import 'package:cloud_firestore/cloud_firestore.dart';

class EbatliToplamDegerler {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //TOPLAM METRAJ VE TOPLAM BUNDLE ADEDİ
  Future<QuerySnapshot> getToplam() async {
    //Burada doc içindekini dmöndürdüğü için DocumentSnapshot tğüründe döndü, direk collection içindekini döndürse; QuerySnapshot dönecekti
    var snap = await _firestore.collection("counters").get();
    print("gelen veri: $snap");
    return snap;
  }
}
