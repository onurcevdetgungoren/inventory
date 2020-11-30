class Sayac {
  Sayac({this.toplamadet, this.toplammetraj});
  int toplamadet;
  int toplammetraj;
  String isim;

  Sayac.fromMap(Map<String, dynamic> gelenMap) {
    this.toplamadet = gelenMap["toplamadet"];
    this.toplammetraj = gelenMap["toplammetraj"];
    this.isim = gelenMap["isim"];

    Map<String, dynamic> toMap() {
      var map = Map<String, dynamic>();
      map["toplamadet"] = toplamadet;
      map["toplammetraj"] = toplammetraj;
      map["isim"] = isim;
      return map;
    }

    @override
    String toString() {
      // TODO: implement toString
      return 'Sayac{_toplamadet: $toplamadet, _toplammetraj: $toplammetraj, _isim: $isim}';
    }
  }
}
