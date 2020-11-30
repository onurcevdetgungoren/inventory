import 'package:flutter/material.dart';
import 'package:inventory/models/ebatli.dart';
import 'package:inventory/models/plaka_satis.dart';
import 'package:inventory/models/sayac.dart';
import 'package:inventory/repository/ebatli_repository.dart';
import '../locator.dart';

enum EbatliState {
  InitialState,
  LoadingState,
  LoadedState,
  ErrorState,
  Loading2State,
  Loaded2State,
  Error2State,
  Loading3State,
  Loaded3State,
  Error3State,
}

class EbatliViewModel with ChangeNotifier {
  EbatliState _state;
  EbatliRepository _ebatliRepository = locator<EbatliRepository>();
  Ebatlilar _getirilenler;
  EbatliViewModel() {
    _state = EbatliState.InitialState;
    getData();
    //Başlangıçta Çağırılması için getData yazdık.
  }
  /*EbatliViewModel.sorgu() {
    _state = EbatliState.InitialState;
  }*/
  Ebatlilar get getirilenler => _getirilenler;

  //_state i get ve set yaptık
  EbatliState get state => _state;
  set state(EbatliState value) {
    _state = value;
    //Bir atama yaptığımız  için notifyListener koyuyorz.
    notifyListeners();
  }

  //VERİLERİ LİSTELE
  Future<List<Ebatlilar>> getData() async {
    Future<List<Ebatlilar>> a;
    try {
      state = EbatliState.LoadingState;
      a = _ebatliRepository.getEbatlilar().then((value) =>
          value.docs.map((e) => Ebatlilar.fromMap(e.data())).toList());
      state = EbatliState.LoadedState;
    } catch (e) {
      state = EbatliState.ErrorState;
    }
    return a;
  }

  //VERİ EKLE
  Future<void> addPlakaView(Ebatlilar ebatli) async {
    print("add Tetiklendi");
    try {
      state = EbatliState.LoadingState;
      print("loading tetiklendi");
      _ebatliRepository.addPlaka(ebatli);
      state = EbatliState.LoadedState;
      print("Loaded tetiklendi veri gönderildi");
    } catch (e) {
      state = EbatliState.ErrorState;
      print("Hata Alındı");
    }
  }

  //İSME GÖRE SORGULA
  Future<List<Ebatlilar>> getQueryWithNameView(String isim) async {
    //Üstte Tüm plakaları Liste Methodumuzda kullandığımız state leri burada kullanamayız, Onun için yeni Stateler açtık, Çok önemli
    Future<List<Ebatlilar>> a;
    try {
      state = EbatliState.Loading2State;
      a = _ebatliRepository.getQuerywithNameRepo(isim).then((value) =>
          value.docs.map((e) => Ebatlilar.fromMap(e.data())).toList());
      state = EbatliState.Loaded2State;
    } catch (e) {
      state = EbatliState.Error2State;
    }

    return a;
  }

  //ID ye GÖRE SORGULA
  Future<List<Ebatlilar>> getQueryWithIdView(String id) async {
    //Üstte Tüm plakaları Liste Methodumuzda kullandığımız state leri burada kullanamayız, Onun için yeni Stateler açtık, Çok önemli
    Future<List<Ebatlilar>> a;
    try {
      state = EbatliState.Loading3State;
      a = _ebatliRepository.getQuerywithIdRepo(id).then((value) =>
          value.docs.map((e) => Ebatlilar.fromMap(e.data())).toList());
      state = EbatliState.Loaded3State;
    } catch (e) {
      state = EbatliState.Error3State;
    }

    return a;
  }

  //ID İLE SİLME İŞLEMİ
  Future<void> silmeIslemiView(Ebatlilar ebatli) async {
    //Buraya esasında String olarak sadece İd yi göndererekte bu işlemi yapabilirdik ama, Tüm Toplam envanterin tutulduğu
    //Tabloda silme işleminden sonra eksiltme yapacağımız için mecburen Ebatlilar cinsinden model olarak gönderdik ama silme için
    //Sadece yine id yi kullandık.
    print("add Tetiklendi");
    try {
      state = EbatliState.LoadingState;
      print("loading tetiklendi");
      _ebatliRepository.silmeIslemiRepo(ebatli);
      state = EbatliState.LoadedState;
      print("Loaded tetiklendi veri gönderildi");
    } catch (e) {
      state = EbatliState.ErrorState;
      print("Hata Alındı");
    }
  }

  void stateGuncelle() {
    state = EbatliState.InitialState;
  }

  //SATIŞ YAPMA, SATIŞ TABLOSU
  //Satılanlar Tablosuna VERi EKLE
  Future<void> satisYapView(PlakaSatis plakaSatis) async {
    print("satisYap Tetiklendi");
    try {
      state = EbatliState.LoadingState;
      print("loading tetiklendi");
      _ebatliRepository.satisYapRepo(plakaSatis);
      state = EbatliState.LoadedState;
      print("Loaded tetiklendi veri gönderildi");
    } catch (e) {
      state = EbatliState.ErrorState;
      print("Hata Alındı");
    }
  }

  //SATILAN PLAKALRI LİSTELEME
  //VERİLERİ LİSTELE
  Future<List<PlakaSatis>> getSatilanPlakalarView() async {
    Future<List<PlakaSatis>> a;
    try {
      state = EbatliState.LoadingState;
      a = _ebatliRepository.getSatilanEbatlilar().then((value) =>
          value.docs.map((e) => PlakaSatis.fromMap(e.data())).toList());
      state = EbatliState.LoadedState;
    } catch (e) {
      state = EbatliState.ErrorState;
    }
    return a;
  }
}
