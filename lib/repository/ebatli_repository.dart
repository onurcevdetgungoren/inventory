import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory/models/ebatli.dart';
import 'package:inventory/models/plaka_satis.dart';

class EbatliRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Ebatlilar> _tumEbatlilar;

  List get tumEbatlilar => _tumEbatlilar;

  //VERİ LİSTELE
  Future<QuerySnapshot> getEbatlilar() async {
    var snap = await _firestore.collection("Plakalar").get();
    return snap;
  }

  //VERi EKLE
  Future<void> addPlaka(Ebatlilar ebatli) async {
    print("Client add Tetiklendi");
    _firestore.doc("/Plakalar/${ebatli.id}").set(ebatli.toMap()).then((value) {
      //Yeni palet eklediğimizde Palet sayılarının tutulduğu düğümümüzdeki değerleri arttırıyoruz, öncelikle toplam palet değerini1 arttırıyoruz
      //Sonrasında aşağıdaki gibi ismine göre ekleme veya yeni oluşturma işlemi yapıyoruz.
      _firestore.doc("/counters/PlakaGenelToplam").update({
        "toplamadet": FieldValue.increment(1),
        "toplammetraj": FieldValue.increment(ebatli.metraj)
      });
      //Aşağıda gönderdiğmiz palet ismi ile ilgili bir doküman olup olmadığnı sorguladık, eğer var ise update yap,
      //Yok ise yeni olutur dedik.
      _firestore
          .collection("counters")
          .doc("${ebatli.isim}")
          .get()
          .then((docSnapshot) => {
                if (docSnapshot.exists)
                  {
                    _firestore.doc("/counters/${ebatli.isim}").update({
                      "toplamadet": FieldValue.increment(1),
                      "toplammetraj": FieldValue.increment(ebatli.metraj)
                    })
                  }
                else
                  {
                    _firestore.doc("/counters/${ebatli.isim}").set({
                      "isim": ebatli.isim,
                      "toplamadet": FieldValue.increment(1),
                      "toplammetraj": FieldValue.increment(ebatli.metraj)
                    })
                  }
              });
    });
  }

  //VERİ SORGULA
  Future<QuerySnapshot> getQuerywithNameRepo(String isim) async {
    var snap = await _firestore
        .collection("Plakalar")
        .where("isim", isEqualTo: isim)
        .get();
    return snap;
  }

  //ID ile VERİ SORGULA
  Future<QuerySnapshot> getQuerywithIdRepo(String id) async {
    var snap = await _firestore
        .collection("Plakalar")
        .where("id", isEqualTo: id)
        .get();
    return snap;
  }

  //ID ile SİLME İŞLEMİ
  Future<void> silmeIslemiRepo(Ebatlilar ebatli) async {
    //Buraya esasında String olarak sadece İd yi göndererekte bu işlemi yapabilirdik ama, Tüm Toplam envanterin tutulduğu
    //Tabloda silme işleminden sonra eksiltme yapacağımız için mecburen Ebatlilar cinsinden model olarak gönderdik ama silme için
    //Sadece yine id yi kullandık.
    print("Repo Silme Tetiklendi");
    _firestore
        .collection("Plakalar")
        .doc("${ebatli.id}")
        .delete()
        .then((value) {
      //collection eklemeden silme yapılmaz.
      print("fireBase tetiklendi");
      _firestore.doc("/counters/PlakaGenelToplam").update({
        "toplamadet": FieldValue.increment(-1),
        "toplammetraj": FieldValue.increment(-ebatli.metraj)
      });
      //incrementi -(eksi) olarak yazınca arttırmak yerine azaltma yapacak.
      _firestore.doc("/counters/${ebatli.isim}").update({
        "toplamadet": FieldValue.increment(-1),
        "toplammetraj": FieldValue.increment(-ebatli.metraj)
      });
    });
  }

  //SATIŞ YAPMA, SATIŞ TABLOSU
  //Satılanlar Tablosuna VERi EKLE
  Future<void> satisYapRepo(PlakaSatis plakaSatis) async {
    print("Client add Tetiklendi");
    _firestore.doc("/SatilanPlakalar/${plakaSatis.id}").set(plakaSatis.toMap());
  }

  //SATILAN PLAKALAR LİSTELEME
  //VERİ LİSTELE
  Future<QuerySnapshot> getSatilanEbatlilar() async {
    var snap = await _firestore.collection("SatilanPlakalar").get();
    return snap;
  }
}
