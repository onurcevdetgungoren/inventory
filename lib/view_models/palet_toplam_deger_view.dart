import 'package:flutter/material.dart';
import 'package:inventory/models/sayac.dart';
import 'package:inventory/repository/paletler_toplam_degerler.dart';
import '../locator.dart';

enum PaletDegerlerState { InitialState, LoadingState, LoadedState, ErrorState }

class PaletDegerler with ChangeNotifier {
  PaletlerToplamDeger _paletlerToplamDeger = locator<PaletlerToplamDeger>();
  PaletDegerlerState _state;

  //Constructor
  PaletDegerler() {
    _state = PaletDegerlerState.InitialState;
  }

  //_state i get ve set yaptık
  PaletDegerlerState get state => _state;
  set state(PaletDegerlerState value) {
    _state = value;
    //Bir atama yaptığımız  için notifyListener koyuyorz.
    notifyListeners();
  }

  //VERİLERİN TOPLAM METRAJ VE ADETLERİNİ GETİRİYORUZ,
  //BUNUN İÇİN BİR SAYAC MODELİ OLUŞTURDUK
  Future<List<Sayac>> getToplamView() async {
    Future<List<Sayac>> getirilensayac;
    try {
      state = PaletDegerlerState.LoadingState;
      print("Loading");
      getirilensayac = _paletlerToplamDeger.getToplamRepo().then(
          (value) => value.docs.map((e) => Sayac.fromMap(e.data())).toList());
      print("gelen veri: $getirilensayac");
      state = PaletDegerlerState.LoadedState;
    } catch (e) {
      state = PaletDegerlerState.ErrorState;
    }
    return getirilensayac;
  }
}
