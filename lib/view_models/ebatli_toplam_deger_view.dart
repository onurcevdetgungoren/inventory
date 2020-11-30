import 'package:flutter/material.dart';
import 'package:inventory/models/sayac.dart';
import 'package:inventory/repository/ebatli_toplam_degerler.dart';
import '../locator.dart';

enum EbatliDegerlerState { InitialState, LoadingState, LoadedState, ErrorState }

class EbatliDegerler with ChangeNotifier {
  EbatliToplamDegerler _ebatliToplamDegerler = locator<EbatliToplamDegerler>();

  EbatliDegerlerState _state;

  //Constructor
  EbatliDegerler() {
    _state = EbatliDegerlerState.InitialState;
  }
  //_state i get ve set yaptık
  EbatliDegerlerState get state => _state;
  set state(EbatliDegerlerState value) {
    _state = value;
    //Bir atama yaptığımız  için notifyListener koyuyorz.
    notifyListeners();
  }

//VERİLERİN TOPLAM METRAJ VE ADETLERİNİ GETİRİYORUZ,
  //BUNUN İÇİN BİR SAYAC MODELİ OLUŞTURDUK
  Future<List<Sayac>> getToplam1View() async {
    Future<List<Sayac>> getirilensayac;
    try {
      state = EbatliDegerlerState.LoadingState;
      print("Loading");
      getirilensayac = _ebatliToplamDegerler.getToplam().then(
          (value) => value.docs.map((e) => Sayac.fromMap(e.data())).toList());
      print("gelen veri: $getirilensayac");
      state = EbatliDegerlerState.LoadedState;
    } catch (e) {
      state = EbatliDegerlerState.ErrorState;
    }
    return getirilensayac;
  }

  /* Future<Sayac> getToplamView() async {
    try {
      state = EbatliDegerlerState.LoadingState;
      print("Loading");
      _getirilensayac = await _ebatliToplamDegerler
          .getToplam("PlakaGenelToplam")
          .then((value) => Sayac.fromMap(value.data()));
      print("gelen veri: $_getirilensayac");
      state = EbatliDegerlerState.LoadedState;
    } catch (e) {
      state = EbatliDegerlerState.ErrorState;
    }
    return _getirilensayac;
  }

  Future<Sayac> getToplamBlackOliveView() async {
    try {
      state = EbatliDegerlerState.LoadingState;
      print("Loading");
      _getirilensayacBlackOlive = await _ebatliToplamDegerler
          .getToplam("Black Olive")
          .then((value) => Sayac.fromMap(value.data()));
      print("gelen veri: $_getirilensayacBlackOlive");
      state = EbatliDegerlerState.LoadedState;
    } catch (e) {
      state = EbatliDegerlerState.ErrorState;
    }
    return _getirilensayacBlackOlive;
  }

  Future<Sayac> getToplamDarkCreamView() async {
    try {
      state = EbatliDegerlerState.LoadingState;
      print("Loading");
      _getirilensayacDarkCream = await _ebatliToplamDegerler
          .getToplam("Dark Cream")
          .then((value) => Sayac.fromMap(value.data()));
      print("gelen veri: $_getirilensayacDarkCream");
      state = EbatliDegerlerState.LoadedState;
    } catch (e) {
      state = EbatliDegerlerState.ErrorState;
    }
    return _getirilensayacDarkCream;
  }

  Future<Sayac> getToplamMuglaWhiteView() async {
    try {
      state = EbatliDegerlerState.LoadingState;
      print("Loading");
      _getirilensayacMuglaWhite = await _ebatliToplamDegerler
          .getToplam("Mugla White")
          .then((value) => Sayac.fromMap(value.data()));
      print("gelen veri: $_getirilensayacMuglaWhite");
      state = EbatliDegerlerState.LoadedState;
    } catch (e) {
      state = EbatliDegerlerState.ErrorState;
    }
    return _getirilensayacMuglaWhite;
  }

  Future<Sayac> getToplamCappucinoView() async {
    try {
      state = EbatliDegerlerState.LoadingState;
      print("Loading");
      _getirilensayacCappucino = await _ebatliToplamDegerler
          .getToplam("Cappucino")
          .then((value) => Sayac.fromMap(value.data()));
      print("gelen veri: $_getirilensayacCappucino");
      state = EbatliDegerlerState.LoadedState;
    } catch (e) {
      state = EbatliDegerlerState.ErrorState;
    }
    return _getirilensayacCappucino;
  }

  Future<Sayac> getToplamOliveMarronView() async {
    try {
      state = EbatliDegerlerState.LoadingState;
      print("Loading");
      _getirilensayacOliveMarron = await _ebatliToplamDegerler
          .getToplam("Olive Marron")
          .then((value) => Sayac.fromMap(value.data()));
      print("gelen veri: $_getirilensayacOliveMarron");
      state = EbatliDegerlerState.LoadedState;
    } catch (e) {
      state = EbatliDegerlerState.ErrorState;
    }
    return _getirilensayacOliveMarron;
  }*/
}
