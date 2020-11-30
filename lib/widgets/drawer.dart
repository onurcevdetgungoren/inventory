import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inventory/home_page.dart';
import 'package:inventory/view_models/google_auth_view_models..dart';
import 'package:provider/provider.dart';

import '../login_page.dart';
import 'paletler/paletler.dart';
import 'paletler/satilan_paletler_list.dart';
import 'plakalar/plakalar.dart';
import 'plakalar/satilan_plakalar_list.dart';
import 'urunsayilari.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, LoginViewModel _loginViewmodel, widget) => Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    "A",
                    style: TextStyle(color: Colors.amber, fontSize: 26),
                  ),
                  backgroundColor: Colors.green.shade300,
                ),
                accountName: Text(_loginViewmodel.user.displayName),
                accountEmail: Text(_loginViewmodel.user.email)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Plakalar())),
                  child: Container(
                    //1Tane Container ile sardık çünkü içerdeki container a borderRadius verdiğimizde köşeler beyaz kalıyordu, Böylece transparan yaptık.
                    //İöçerdeki Containerda BoxDecorationda color: Kullandığımız için COntainerda color: kullanamayız.
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "Plaka Koleksiyon",
                        style: TextStyle(
                            fontFamily: "ElYazisi",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaletlerList())),
                  child: Container(
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "Palet Koleksiyon",
                        style: TextStyle(
                            fontFamily: "ElYazisi",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SatilanPlakalar())),
                  child: Container(
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "Satış Yapılan Plakalar",
                        style: TextStyle(
                            fontFamily: "ElYazisi",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SatilanPaletler())),
                  child: Container(
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "Satış Yapılan Paletler",
                        style: TextStyle(
                            fontFamily: "ElYazisi",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UrunSayilari())),
                  child: Container(
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "Güncel Stok Sayıları",
                        style: TextStyle(
                            fontFamily: "ElYazisi",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage())),
                  child: Container(
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "AnaSayfa",
                        style: TextStyle(
                            fontFamily: "ElYazisi",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Consumer(
                  builder: (context, LoginViewModel _loginViewModel, widget) =>
                      InkWell(
                    onTap: () {
                      _loginViewModel.logOutViewModel();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "Çıkış Yap",
                          style: TextStyle(
                              fontFamily: "ElYazisi",
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                /*SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 100,
                  color: Colors.transparent,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "")),
                    ),
                  ),
                ),
              ],
            ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
