import 'package:flutter/material.dart';
import 'package:inventory/models/ebatli.dart';
import 'package:inventory/models/plaka_satis.dart';
import 'package:inventory/view_models/ebatli_view_models.dart';
import 'package:provider/provider.dart';

import '../drawer.dart';

class SecilenPlakaDetay extends StatelessWidget {
  String id;
  SecilenPlakaDetay({@required this.id});
  var _fKey = GlobalKey<FormState>();
  var _fKey2 = GlobalKey<FormState>();
  final _textControllerIsim = TextEditingController();
  final _textControllerCins = TextEditingController();
  final _textControllerId = TextEditingController();
  final _textControllerEn = TextEditingController();
  final _textControllerBoy = TextEditingController();
  final _textControllerMetraj = TextEditingController();
  final _textControllerKalite = TextEditingController();
  final _textControllerqrUrl = TextEditingController();
  final _textControllerMusteriAd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, EbatliViewModel _viewModel, widget) => Scaffold(
              drawer: AppDrawer(),
              appBar: AppBar(
                title: Text("Düzenle"),
              ),
              body: FutureBuilder(
                  future: _viewModel.getQueryWithIdView(id),
                  builder: (context, AsyncSnapshot<List<Ebatlilar>> sonuc) {
                    print("Gelen Sorgu sonucu: " + sonuc.data.toString());
                    if (sonuc.hasData) {
                      _textControllerIsim.text = sonuc.data[0].isim;
                      _textControllerCins.text = sonuc.data[0].cins;
                      _textControllerId.text = sonuc.data[0].id;
                      _textControllerEn.text = sonuc.data[0].en.toString();
                      _textControllerBoy.text = sonuc.data[0].boy.toString();
                      _textControllerMetraj.text =
                          sonuc.data[0].metraj.toString();
                      _textControllerKalite.text = sonuc.data[0].kalite;
                      _textControllerqrUrl.text = sonuc.data[0].qrurl;

                      return (_viewModel.state == EbatliState.Loading3State)
                          ? veriGeliyor()
                          : (_viewModel.state == EbatliState.Error3State)
                              ? hataGeldi()
                              : (_viewModel.state == EbatliState.Loaded3State)
                                  ? Form(
                                      key: _fKey,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: _textControllerIsim,
                                                decoration: InputDecoration(
                                                  labelText: "İsim Giriniz",
                                                  hintText: "İsim",
                                                  border: OutlineInputBorder(),
                                                ),
                                                validator: (s) {
                                                  if (s.isEmpty) {
                                                    return "Boş Olamaz";
                                                  } else
                                                    return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: _textControllerCins,
                                                decoration: InputDecoration(
                                                  labelText: "Cins Giriniz",
                                                  hintText: "Cins",
                                                  border: OutlineInputBorder(),
                                                ),
                                                validator: (s) {
                                                  if (s.isEmpty) {
                                                    return "Boş Olamaz";
                                                  } else
                                                    return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller:
                                                    _textControllerMetraj,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText: "Metraj Giriniz",
                                                  hintText: "Metraj",
                                                  border: OutlineInputBorder(),
                                                ),
                                                validator: (s) {
                                                  if (s.isEmpty) {
                                                    return "Boş Olamaz";
                                                  } else
                                                    return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: _textControllerEn,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText: "En Giriniz",
                                                  hintText: "En",
                                                  border: OutlineInputBorder(),
                                                ),
                                                validator: (s) {
                                                  if (s.isEmpty) {
                                                    return "Boş Olamaz";
                                                  } else
                                                    return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: _textControllerBoy,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText: "Boy Giriniz",
                                                  hintText: "Boy",
                                                  border: OutlineInputBorder(),
                                                ),
                                                validator: (s) {
                                                  if (s.isEmpty) {
                                                    return "Boş Olamaz";
                                                  } else
                                                    return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller:
                                                    _textControllerKalite,
                                                decoration: InputDecoration(
                                                  labelText: "Kalite Giriniz",
                                                  hintText: "Kalite",
                                                  border: OutlineInputBorder(),
                                                ),
                                                validator: (s) {
                                                  if (s.isEmpty) {
                                                    return "Boş Olamaz";
                                                  } else
                                                    return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: _textControllerId,
                                                decoration: InputDecoration(
                                                  labelText: "Id Giriniz",
                                                  hintText: "Id",
                                                  border: OutlineInputBorder(),
                                                ),
                                                validator: (s) {
                                                  if (s.isEmpty) {
                                                    return "Boş Olamaz";
                                                  } else
                                                    return null;
                                                },
                                              ),
                                            ),
                                            //Satış yapma için TextField ve Button kısımları
                                            //Burada Satış yapılacağı zaman müşteri ismi girilmesini istiyoruz ve Mevcut Plakayı envanterden silip, Satılan Paletler
                                            //Tablosuna atıyoruz.
                                            //Form2 açmamızın sebebi; Sil ve Güncelle işlemlerinde müşteri ismi girilmediğinde validate işlemi yapılamıyordu Bunun için
                                            //Müşteri İsmini 2. bir _fkey ile tuttuk.
                                            Form(
                                                key: _fKey2,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      //Satış Button ve Müşteri İsmi Girilecek Text
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: TextFormField(
                                                          controller:
                                                              _textControllerMusteriAd,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                "Satış için Müşteri İsmi Giriniz",
                                                            hintText:
                                                                "Müşteri İsmi",
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                          validator: (s) {
                                                            if (s.isEmpty) {
                                                              return "Boş Olamaz";
                                                            } else
                                                              return null;
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),

                                            //UPDATE BUTONU
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ButtonTheme(
                                                  minWidth: 150,
                                                  height: 40,
                                                  child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                      child: Text("Güncelle",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      color:
                                                          Colors.blue.shade500,
                                                      onPressed: () {
                                                        if (_fKey.currentState
                                                            .validate()) {
                                                          //_fKey.currentState.save();
                                                          _viewModel.addPlakaView(
                                                              Ebatlilar(
                                                                  //Update Komutu ile, Ekleme komutuset olarak aynı şekilde kullnılabilir, Oyüzdenyeni bir update Komutu açmadık.
                                                                  _textControllerKalite
                                                                      .text,
                                                                  _textControllerCins
                                                                      .text,
                                                                  int.parse(
                                                                      _textControllerEn
                                                                          .text),
                                                                  int.parse(
                                                                      _textControllerMetraj
                                                                          .text),
                                                                  _textControllerId
                                                                      .text,
                                                                  int.parse(
                                                                      _textControllerBoy
                                                                          .text),
                                                                  _textControllerIsim
                                                                      .text,
                                                                  _textControllerqrUrl
                                                                      .text));
                                                        }
                                                        (_viewModel.state ==
                                                                EbatliState
                                                                    .LoadedState)
                                                            ? veriGeldi(context)
                                                            //Ana sayfa geri yüklendiği için direk GetData methodu tetikleniyor.
                                                            : (_viewModel
                                                                        .state ==
                                                                    EbatliState
                                                                        .LoadingState)
                                                                ? veriGeliyor()
                                                                : (_viewModel
                                                                            .state ==
                                                                        EbatliState
                                                                            .ErrorState)
                                                                    ? hataGeldi()
                                                                    : Text(
                                                                        "Seçim");
                                                      }),
                                                ),
                                                //DELETE BUTTON
                                                ButtonTheme(
                                                  minWidth: 150,
                                                  height: 40,
                                                  child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                      child: Text("Sil",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      color:
                                                          Colors.green.shade800,
                                                      onPressed: () {
                                                        if (_fKey.currentState
                                                            .validate()) {
                                                          _fKey.currentState
                                                              .save();
                                                          _viewModel
                                                              .silmeIslemiView(
                                                                  //Buraya esasında String olarak sadece İd yi göndererekte bu işlemi yapabilirdik ama, Tüm Toplam envanterin tutulduğu
                                                                  //Tabloda silme işleminden sonra eksiltme yapacağımız için mecburen Ebatlilar cinsinden model olarak gönderdik ama silme için
                                                                  //Sadece yine id yi kullandık.
                                                                  Ebatlilar(
                                                                      //Update Komutu ile, Ekleme komutuset olarak aynı şekilde kullnılabilir, Oyüzdenyeni bir update Komutu açmadık.
                                                                      _textControllerKalite
                                                                          .text,
                                                                      _textControllerCins
                                                                          .text,
                                                                      int.parse(
                                                                          _textControllerEn
                                                                              .text),
                                                                      int.parse(
                                                                          _textControllerMetraj
                                                                              .text),
                                                                      _textControllerId
                                                                          .text,
                                                                      int.parse(
                                                                          _textControllerBoy
                                                                              .text),
                                                                      _textControllerIsim
                                                                          .text,
                                                                      _textControllerqrUrl
                                                                          .text));
                                                        }

                                                        (_viewModel.state ==
                                                                EbatliState
                                                                    .LoadedState)
                                                            ? veriGeldi(context)
                                                            //Ana sayfa geri yüklendiği için direk GetData methodu tetikleniyor.
                                                            : (_viewModel
                                                                        .state ==
                                                                    EbatliState
                                                                        .LoadingState)
                                                                ? veriGeliyor()
                                                                : (_viewModel
                                                                            .state ==
                                                                        EbatliState
                                                                            .ErrorState)
                                                                    ? hataGeldi()
                                                                    : Text(
                                                                        "Seçim");
                                                      }),
                                                ),
                                                //SATIŞ BUTONU
                                                ButtonTheme(
                                                  minWidth: 150,
                                                  height: 40,
                                                  child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                      child: Text("Satış Yap",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      color:
                                                          Colors.green.shade300,
                                                      onPressed: () {
                                                        if (_fKey2 //2.Form için oluşturduğumuz fKey2 yi kullandık çünkü yoksa diğer sil ve güncelle işlemlerinde Müşteri ismi Boş olduğunda
                                                            //İşlem Yapmaz.
                                                            .currentState
                                                            .validate()) {
                                                          _fKey.currentState
                                                              .save();
                                                          _fKey2.currentState
                                                              .save();
                                                          _viewModel.satisYapView(PlakaSatis(
                                                              _textControllerKalite
                                                                  .text,
                                                              _textControllerCins
                                                                  .text,
                                                              int.parse(
                                                                  _textControllerEn
                                                                      .text),
                                                              int.parse(
                                                                  _textControllerMetraj
                                                                      .text),
                                                              _textControllerId
                                                                  .text,
                                                              int.parse(
                                                                  _textControllerBoy
                                                                      .text),
                                                              _textControllerIsim
                                                                  .text,
                                                              _textControllerqrUrl
                                                                  .text,
                                                              _textControllerMusteriAd
                                                                  .text));
                                                          _viewModel
                                                              .silmeIslemiView(
                                                                  //Buraya esasında String olarak sadece İd yi göndererekte bu işlemi yapabilirdik ama, Tüm Toplam envanterin tutulduğu
                                                                  //Tabloda silme işleminden sonra eksiltme yapacağımız için mecburen Ebatlilar cinsinden model olarak gönderdik ama silme için
                                                                  //Sadece yine id yi kullandık.
                                                                  Ebatlilar(
                                                                      //Update Komutu ile, Ekleme komutuset olarak aynı şekilde kullnılabilir, Oyüzdenyeni bir update Komutu açmadık.
                                                                      _textControllerKalite
                                                                          .text,
                                                                      _textControllerCins
                                                                          .text,
                                                                      int.parse(
                                                                          _textControllerEn
                                                                              .text),
                                                                      int.parse(
                                                                          _textControllerMetraj
                                                                              .text),
                                                                      _textControllerId
                                                                          .text,
                                                                      int.parse(
                                                                          _textControllerBoy
                                                                              .text),
                                                                      _textControllerIsim
                                                                          .text,
                                                                      _textControllerqrUrl
                                                                          .text));
                                                        }

                                                        (_viewModel.state ==
                                                                EbatliState
                                                                    .LoadedState)
                                                            ? veriGeldi(context)
                                                            //Ana sayfa geri yüklendiği için direk GetData methodu tetikleniyor.
                                                            : (_viewModel
                                                                        .state ==
                                                                    EbatliState
                                                                        .LoadingState)
                                                                ? veriGeliyor()
                                                                : (_viewModel
                                                                            .state ==
                                                                        EbatliState
                                                                            .ErrorState)
                                                                    ? hataGeldi()
                                                                    : Text(
                                                                        "Seçim");
                                                      }),
                                                ),
                                              ],
                                            ),

                                            //Qr Code adresinden resim olarak çekiyoruz.
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                _textControllerqrUrl.text,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  : Text("Görüntülenmedi");
                    } else {
                      return Center(
                        child: LinearProgressIndicator(),
                      );
                    }
                  }),
            ));
  }

  veriGeliyor() {
    //Hem Listeleme,Updateidelete için Kullanılıyor
    return CircularProgressIndicator();
  }

  hataGeldi() {
    Text("Plakalar getirilirken hata oluştu");
    //Listeleme, Update, delete için Kullanılıyor
  }

  veriGeldi(BuildContext context) {
    //Sadece Update ve delete İşleminden sonra kullanılıypr
    Navigator.pop(context);
  }
}
