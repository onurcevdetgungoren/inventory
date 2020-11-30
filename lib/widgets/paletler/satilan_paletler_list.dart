import 'package:flutter/material.dart';
import 'package:inventory/models/palet_satis.dart';
import 'package:inventory/view_models/paletler_view_models.dart';
import 'package:provider/provider.dart';

import '../drawer.dart';

class SatilanPaletler extends StatefulWidget {
  @override
  _SatilanPaletlerState createState() => _SatilanPaletlerState();
}

//SATIŞ YAPILAN PALETLERİ LİSTELEME.
class _SatilanPaletlerState extends State<SatilanPaletler> {
  @override
  Widget build(BuildContext context) {
    String bejUrl =
        "https://previews.123rf.com/images/alexeybykov/alexeybykov1511/alexeybykov151100035/48245835-seamless-beige-marble-background-with-natural-pattern-tiled-cream-marble-stone-wall-texture-.jpg";
    String oliveMarronUrl =
        "https://image.freepik.com/free-photo/black-marbled-surface_53876-90798.jpg";
    String muglaBejUrl =
        "https://image.freepik.com/free-photo/close-up-black-marble-textured-background_53876-63511.jpg";
    String emperadorUrl =
        "https://thumbs.dreamstime.com/b/polished-slab-natural-spanish-emperador-dark-marble-natural-emperador-dark-marble-texture-design-decorative-129795127.jpg";
    String travertineUrl =
        "https://thumb.bibliocad.com/thumbs/content/586x440/00040000/4000/44601.webp";
    return Consumer(
      builder: (context, PaletlerViewModel _viewModel, widget) => Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          title: Text("Satılan Paletler"),
        ),
        body: FutureBuilder(
            future: _viewModel.getSatilanPaletModel(),
            builder: (context, AsyncSnapshot<List<PaletSatis>> sonuc) {
              if (sonuc.hasData) {
                print("Gelen:" + sonuc.data.toString());
                return (_viewModel.state == PaletlerState.LoadedState)
                    ? ListView.builder(
                        itemCount: sonuc.data.length,
                        itemBuilder: (context, index) => Card(
                              child: ExpansionTile(
                                title: Text(sonuc.data[index].musteriad),
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: sonuc.data[index].isim ==
                                                  "Olive Marron"
                                              ? NetworkImage(oliveMarronUrl)
                                              : sonuc.data[index].isim ==
                                                      "Dark Cream"
                                                  ? NetworkImage(bejUrl)
                                                  : sonuc.data[index].isim ==
                                                          "Muğla White"
                                                      ? NetworkImage(
                                                          muglaBejUrl)
                                                      : sonuc.data[index]
                                                                  .isim ==
                                                              "Black Olive"
                                                          ? NetworkImage(
                                                              emperadorUrl)
                                                          : NetworkImage(
                                                              travertineUrl),
                                          fit: BoxFit.cover),
                                    ),
                                    /*color: index % 2 == 0
                                                      ? Colors.orange.shade300
                                                      : Colors.lightBlue.shade300,*/
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Satış Yapılan Müşteri: " +
                                              sonuc.data[index].musteriad,
                                          style: TextStyle(
                                              fontFamily: "ElYazisi",
                                              fontSize: 15,
                                              color: sonuc.data[index].isim ==
                                                          "Olive Marron" ||
                                                      sonuc.data[index].isim ==
                                                          "Black Olive"
                                                  ? Colors.white70
                                                  : Colors.black45),
                                        ),
                                        Text(
                                          sonuc.data[index].isim,
                                          style: TextStyle(
                                              fontFamily: "ElYazisi",
                                              fontSize: 20,
                                              color: sonuc.data[index].isim ==
                                                          "Olive Marron" ||
                                                      sonuc.data[index].isim ==
                                                          "Black Olive"
                                                  ? Colors.white70
                                                  : Colors.black45),
                                        ),
                                        Text(
                                          "Cins: " + sonuc.data[index].cins,
                                          style: TextStyle(
                                              fontFamily: "ElYazisi",
                                              fontSize: 15,
                                              color: sonuc.data[index].isim ==
                                                          "Olive Marron" ||
                                                      sonuc.data[index].isim ==
                                                          "Black Olive"
                                                  ? Colors.white70
                                                  : Colors.black45),
                                        ),
                                        Text(
                                          "Kalite: " + sonuc.data[index].kalite,
                                          style: TextStyle(
                                              fontFamily: "ElYazisi",
                                              fontSize: 15,
                                              color: sonuc.data[index].isim ==
                                                          "Olive Marron" ||
                                                      sonuc.data[index].isim ==
                                                          "Black Olive"
                                                  ? Colors.white70
                                                  : Colors.black45),
                                        ),
                                        Text(
                                          "En: " +
                                              sonuc.data[index].en.toString(),
                                          style: TextStyle(
                                              fontFamily: "ElYazisi",
                                              fontSize: 15,
                                              color: sonuc.data[index].isim ==
                                                          "Olive Marron" ||
                                                      sonuc.data[index].isim ==
                                                          "Black Olive"
                                                  ? Colors.white70
                                                  : Colors.black45),
                                        ),
                                        Text(
                                          "Boy: " +
                                              sonuc.data[index].boy.toString(),
                                          style: TextStyle(
                                              fontFamily: "ElYazisi",
                                              fontSize: 15,
                                              color: sonuc.data[index].isim ==
                                                          "Olive Marron" ||
                                                      sonuc.data[index].isim ==
                                                          "Black Olive"
                                                  ? Colors.white70
                                                  : Colors.black45),
                                        ),
                                        Text(
                                          "Toplam Metraj: " +
                                              sonuc.data[index].metraj
                                                  .toString(),
                                          style: TextStyle(
                                              fontFamily: "ElYazisi",
                                              fontSize: 15,
                                              color: sonuc.data[index].isim ==
                                                          "Olive Marron" ||
                                                      sonuc.data[index].isim ==
                                                          "Black Olive"
                                                  ? Colors.white70
                                                  : Colors.black45),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                    : (_viewModel.state == PaletlerState.LoadingState)
                        ? veriGeliyor()
                        : (_viewModel.state == PaletlerState.ErrorState)
                            ? hataGeldi()
                            : Text("Hata");
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
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
