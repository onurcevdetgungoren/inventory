import 'package:flutter/material.dart';
import 'package:inventory/view_models/qr_code_view_models.dart';
import 'package:provider/provider.dart';

import '../drawer.dart';

class IdSorguEkrani extends StatefulWidget {
  @override
  _IdSorguEkraniState createState() => _IdSorguEkraniState();
}

class _IdSorguEkraniState extends State<IdSorguEkrani> {
  final _textControllerId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _fKey = GlobalKey<FormState>();
    String id;
    return Consumer(
        builder: (context, QrViewModels _qrViewModel, widget) => Scaffold(
              drawer: AppDrawer(),
              appBar: AppBar(
                title: Text("Id İle Sorgu Ekranı"),
              ),
              body: Container(
                decoration: BoxDecoration(),
                child: Form(
                    key: _fKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _textControllerId,
                            decoration: InputDecoration(
                              labelText: "Qr Kod Okutunuz",
                              hintText: "Qr Kod Okutunuz",
                              border: OutlineInputBorder(),
                            ),
                            validator: (s) {
                              if (s.isEmpty) {
                                return "8 Karakterden Az olamaz";
                              } else
                                return null;
                            },
                          ),
                        ),
                        /*Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                              future: _viewModel.getData(),
                              builder: (context,
                                  AsyncSnapshot<List<Ebatlilar>> sonuc) {
                                if (sonuc.hasData) {
                                  return DropdownButton<String>(
                                      hint: Text("Seçiniz"),
                                      items: sonuc.data.map((e) {
                                        return DropdownMenuItem<String>(
                                          child: Text(e.isim),
                                          value: e.isim,
                                        );
                                      }).toList(),
                                      value: geciciIsim,
                                      onChanged: (s) {
                                        geciciIsim = s;
                                      });
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ),*/
                        ButtonTheme(
                          minWidth: 150,
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)),
                          child: RaisedButton(
                              child: Text("Sorgula",
                                  style: TextStyle(color: Colors.white)),
                              color: Colors.green.shade800,
                              onPressed: () {
                                if (_fKey.currentState.validate()) {
                                  _fKey.currentState.save();
                                  id = _textControllerId.text;
                                  //isim = geciciIsim;
                                  Navigator.pop(context, id);
                                }
                              }),
                        ),
                        ButtonTheme(
                          minWidth: 150,
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)),
                          child: RaisedButton(
                              child: Text("Qr Oku",
                                  style: TextStyle(color: Colors.white)),
                              color: Colors.blue.shade500,
                              onPressed: () {
                                _qrViewModel.scanBytesViewModel().then(
                                    (value) =>
                                        this._textControllerId.text = value);
                                //_scanBytes();
                              }),
                        ),
                      ],
                    )),
              ),
            ));
  }
}
