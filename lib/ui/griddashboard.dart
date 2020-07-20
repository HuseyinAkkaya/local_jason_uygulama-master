import 'package:finder/ui/grid_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../veriler/model.dart';
import 'grid_list.dart';
import 'package:finder/veriler/model.dart';

class GridDashboard extends StatefulWidget {
  GridDashboard({Key key}) : super(key: key);

  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Future<Kategori> _getKategori() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/veriler.json"); // jsonu okuyup stringe attık
    return kategoriFromJson(
        jsonData); //kategori modele dönüştürdük ve return ile geri döndük.
  }

  @override
  Widget build(BuildContext context) {
    var color = 0xff453658;
    return FutureBuilder(
      future: _getKategori(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        Kategori kategori = snapshot.data as Kategori;
        if (kategori ==
            null) //kategori null olursa ekranda progressbar görünecek.
          return Center(
            child: CircularProgressIndicator(),
          );
        else // data düzgün geldiğinde ekrana liste basılacak.
          return Flexible(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: kategori.exampleData.map((data) {
                return new GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GridList(
                                data))); //Burada constructor ile data verisini sayfaya gönderiyoruz
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.access_alarm,
                          size: 25,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          data.name,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
      },
    );
  }
}

class Items {
  String title;
  //String subtitle;
  //String event;
  //String img;
  Items({this.title});
}
