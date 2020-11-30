import 'package:flutter/material.dart';
import 'package:inventory/models/sayac.dart';
import 'package:inventory/view_models/ebatli_toplam_deger_view.dart';
import 'package:inventory/view_models/palet_toplam_deger_view.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';

class UrunSayilari extends StatefulWidget {
  @override
  _UrunSayilariState createState() => _UrunSayilariState();
}

class _UrunSayilariState extends State<UrunSayilari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Güncel Envanter Listeleri"),
        backgroundColor: Colors.orange.shade200,
      ),
      body: Column(
        children: [
          Consumer(
              builder: (context, EbatliDegerler _ebatlidegerler, widget) =>
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("Güncel Bundle Envanter Listesi",
                                  style: TextStyle(
                                    fontFamily: "ElYazisi",
                                    fontSize: 30,
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Container(
                              child: FutureBuilder(
                                  future: _ebatlidegerler.getToplam1View(),
                                  builder: (context,
                                      AsyncSnapshot<List<Sayac>> sonuc) {
                                    if (sonuc.hasData) {
                                      return (_ebatlidegerler.state ==
                                              EbatliDegerlerState.LoadedState)
                                          ? ListView.builder(
                                              itemCount: sonuc.data.length,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            sonuc.data[index]
                                                                    .isim +
                                                                " Adet :" +
                                                                sonuc
                                                                    .data[index]
                                                                    .toplamadet
                                                                    .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "ElYazisi",
                                                              fontSize: 20,
                                                            )),
                                                        Text(
                                                            sonuc.data[index]
                                                                    .isim +
                                                                " Metraj :" +
                                                                sonuc
                                                                    .data[index]
                                                                    .toplammetraj
                                                                    .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "ElYazisi",
                                                              fontSize: 20,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                          : (_ebatlidegerler.state ==
                                                  EbatliDegerlerState
                                                      .LoadingState)
                                              ? veriGeliyor()
                                              : (_ebatlidegerler.state ==
                                                      EbatliDegerlerState
                                                          .ErrorState)
                                                  ? hataGeldi()
                                                  : Text("Hata");
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
          Consumer(
              builder: (context, PaletDegerler _paletdegerler, widget) =>
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("Güncel Palet Envanter Listesi",
                                  style: TextStyle(
                                    fontFamily: "ElYazisi",
                                    fontSize: 30,
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Container(
                              child: FutureBuilder(
                                  future: _paletdegerler.getToplamView(),
                                  builder: (context,
                                      AsyncSnapshot<List<Sayac>> sonuc) {
                                    if (sonuc.hasData) {
                                      return (_paletdegerler.state ==
                                              PaletDegerlerState.LoadedState)
                                          ? ListView.builder(
                                              itemCount: sonuc.data.length,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            sonuc.data[index]
                                                                    .isim +
                                                                " Adet :" +
                                                                sonuc
                                                                    .data[index]
                                                                    .toplamadet
                                                                    .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "ElYazisi",
                                                              fontSize: 20,
                                                            )),
                                                        Text(
                                                            sonuc.data[index]
                                                                    .isim +
                                                                " Metraj :" +
                                                                sonuc
                                                                    .data[index]
                                                                    .toplammetraj
                                                                    .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "ElYazisi",
                                                              fontSize: 20,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                          : (_paletdegerler.state ==
                                                  PaletDegerlerState
                                                      .LoadingState)
                                              ? veriGeliyor()
                                              : (_paletdegerler.state ==
                                                      PaletDegerlerState
                                                          .ErrorState)
                                                  ? hataGeldi()
                                                  : Text("Hata");
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );
  }

  veriGeliyor() {
    return CircularProgressIndicator();
  }

  hataGeldi() {
    Text("Getirilirken hata oluştu");
  }
}
