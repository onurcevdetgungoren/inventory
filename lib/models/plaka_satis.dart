class PlakaSatis {
  String _kalite;
  String _cins;
  int _en;
  int _metraj;
  String _id;
  int _boy;
  String _isim;
  String _qrurl;
  String _musteriad;

  String get musteriad => _musteriad;

  set musteriad(String value) => _musteriad = value;

  String get qrurl => _qrurl;

  set qrurl(String value) => _qrurl = value;
  String get kalite => _kalite;

  set kalite(String value) => _kalite = value;

  String get cins => _cins;

  set cins(String value) => _cins = value;

  int get en => _en;

  set en(int value) => _en = value;

  int get metraj => _metraj;

  set metraj(int value) => _metraj = value;

  String get id => _id;

  set id(String value) => _id = value;

  int get boy => _boy;

  set boy(int value) => _boy = value;

  String get isim => _isim;

  set isim(String value) => _isim = value;

  PlakaSatis(this._kalite, this._cins, this._en, this._metraj, this._id,
      this._boy, this._isim, this._qrurl, this._musteriad);

  PlakaSatis.fromMap(Map<String, dynamic> gelenMap) {
    this._kalite = gelenMap["kalite"];
    this._cins = gelenMap["cins"];
    this._en = gelenMap["en"];
    this._metraj = gelenMap["metraj"];
    this._id = gelenMap["id"];
    this._boy = gelenMap["boy"];
    this._isim = gelenMap["isim"];
    this._qrurl = gelenMap["qrurl"];
    this._musteriad = gelenMap["musteriad"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["kalite"] = _kalite;
    map["cins"] = _cins;
    map["en"] = _en;
    map["metraj"] = _metraj;
    map["id"] = _id;
    map["boy"] = _boy;
    map["isim"] = _isim;
    map["qrurl"] = _qrurl;
    map["musteriad"] = _musteriad;
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'PlakaSatis{_kalite: $_kalite, _cins: $_cins, _en: $_en, _metraj: $_metraj, _id: $_id, _boy: $_boy, _isim: $_isim, _qrurl: $_qrurl, _musteriad: $_musteriad}';
  }
}
