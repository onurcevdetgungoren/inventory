import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory/models/palet_satis.dart';
import 'package:inventory/models/paletler.dart';

class PaletlerRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Paletler> _tumPaletler;

  List get tumPaletler => _tumPaletler;

  //VERİ LİSTELE
  Future<QuerySnapshot> getPaletler() async {
    var snap = await _firestore.collection("Paletler").get();
    return snap;
  }

  //VERi EKLE
  Future<void> addPlaka(Paletler palet) async {
    print("Client add Tetiklendi");
    _firestore.doc("/Paletler/${palet.id}").set(palet.toMap()).then((value) {
      //Yeni palet eklediğimizde Palet sayılarının tutulduğu düğümümüzdeki değerleri arttırıyoruz, öncelikle toplam palet değerini1 arttırıyoruz
      //Sonrasında aşağıdaki gibi ismine göre ekleme veya yeni oluşturma işlemi yapıyoruz.
      _firestore.doc("/Paletlercounters/PaletGenelToplam").update({
        "toplamadet": FieldValue.increment(1),
        "toplammetraj": FieldValue.increment(palet.metraj)
      });
      //Aşağıda gönderdiğmiz palet ismi ile ilgili bir doküman olup olmadığnı sorguladık, eğer var ise update yap,
      //Yok ise yeni olutur dedik.
      _firestore
          .collection("/Paletlercounters")
          .doc(palet.isim)
          .get()
          .then((docSnapshot) => {
                if (docSnapshot.exists)
                  {
                    _firestore.doc("/Paletlercounters/${palet.isim}").update({
                      "toplamadet": FieldValue.increment(1),
                      "toplammetraj": FieldValue.increment(palet.metraj)
                    }),
                  }
                else
                  {
                    _firestore.doc("/Paletlercounters/${palet.isim}").set({
                      "isim": palet.isim,
                      "toplamadet": FieldValue.increment(1),
                      "toplammetraj": FieldValue.increment(palet.metraj)
                    }),
                  }
              });
    });
  }

  //VERİ SORGULA
  Future<QuerySnapshot> paletlerGetQuerywithNameRepo(String isim) async {
    var snap = await _firestore
        .collection("Paletler")
        .where("isim", isEqualTo: isim)
        .get();
    return snap;
  }

  //ID ile VERİ SORGULA
  Future<QuerySnapshot> paletlerGetQuerywithIdRepo(String id) async {
    var snap = await _firestore
        .collection("Paletler")
        .where("id", isEqualTo: id)
        .get();
    return snap;
  }

  //ID ile SİLME İŞLEMİ
  Future<void> paletSilmeIslemiRepo(Paletler palet) async {
    //Buraya esasında String olarak sadece İd yi göndererekte bu işlemi yapabilirdik ama, Tüm Toplam envanterin tutulduğu
    //Tabloda silme işleminden sonra eksiltme yapacağımız için mecburen Ebatlilar cinsinden model olarak gönderdik ama silme için
    //Sadece yine id yi kullandık.
    print("Repo Palet Silme Tetiklendi");
    _firestore.collection("Paletler").doc("${palet.id}").delete().then((value) {
      //collection eklemeen silme yapılmaz.
      print("fireBase tetiklendi");
      _firestore.doc("/Paletlercounters/PaletGenelToplam").update({
        "toplamadet": FieldValue.increment(-1),
        "toplammetraj": FieldValue.increment(-palet.metraj)
      });
      _firestore.doc("/Paletlercounters/${palet.isim}").update({
        "toplamadet": FieldValue.increment(-1),
        "toplammetraj": FieldValue.increment(-palet.metraj)
      });
    });
  }

  //SATIŞ YAPMA, SATIŞ TABLOSU
  //Satılanlar Tablosuna VERi EKLE
  Future<void> paletSatisYapRepo(PaletSatis paletSatis) async {
    print("Client add Tetiklendi");
    _firestore.doc("/SatilanPaletler/${paletSatis.id}").set(paletSatis.toMap());
  }

  //SATILAN PLAKALAR LİSTELEME
  //VERİ LİSTELE
  Future<QuerySnapshot> getSatilanPaletler() async {
    var snap = await _firestore.collection("SatilanPaletler").get();
    return snap;
  }
}
