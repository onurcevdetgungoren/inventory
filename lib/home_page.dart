import 'package:flutter/material.dart';
import 'package:inventory/login_page.dart';
import 'package:inventory/widgets/paletler/paletler.dart';
import 'package:inventory/widgets/paletler/satilan_paletler_list.dart';
import 'package:inventory/widgets/plakalar/satilan_plakalar_list.dart';
import 'package:inventory/widgets/urunsayilari.dart';
import 'view_models/google_auth_view_models..dart';
import 'widgets/Plakalar/plakalar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Inventory App"),
      ),*/
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://image.freepik.com/free-photo/close-up-black-marble-textured-background_53876-63511.jpg"),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Plakalar())),
              child: Container(
                //1Tane Container ile sardık çünkü içerdeki container a borderRadius verdiğimizde köşeler beyaz kalıyordu, Böylece transparan yaptık.
                //İöçerdeki Containerda BoxDecorationda color: Kullandığımız için COntainerda color: kullanamayız.
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "Plaka Koleksiyon",
                    style: TextStyle(
                        fontFamily: "ElYazisi",
                        fontSize: 20,
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
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "Palet Koleksiyon",
                    style: TextStyle(
                        fontFamily: "ElYazisi",
                        fontSize: 20,
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
                  MaterialPageRoute(builder: (context) => SatilanPlakalar())),
              child: Container(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "Satış Yapılan Plakalar",
                    style: TextStyle(
                        fontFamily: "ElYazisi",
                        fontSize: 20,
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
                  MaterialPageRoute(builder: (context) => SatilanPaletler())),
              child: Container(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "Satış Yapılan Paletler",
                    style: TextStyle(
                        fontFamily: "ElYazisi",
                        fontSize: 20,
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
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "Güncel Stok Sayıları",
                    style: TextStyle(
                        fontFamily: "ElYazisi",
                        fontSize: 20,
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
                    height: 60,
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      "Çıkış Yap",
                      style: TextStyle(
                          fontFamily: "ElYazisi",
                          fontSize: 18,
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
      ),
    );
  }
}
