import 'package:finder/veriler/model.dart';
import 'package:flutter/material.dart';

class GridList extends StatefulWidget {
  GridList(this.data);
  final ExampleDatum data;
  //constructor tanımladık ve bu sayfa oluşurken data nesnesinin gönderilmesini zorunlu kıldık.
  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  @override
  Widget build(BuildContext context) {
    //buradaki futurebuilder'a gerek kalmadı.
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.data == null ? 0 : widget.data.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    child: Image.network(
                        'https://images.unsplash.com/photo-1583595975967-f402ed7a9416?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Text kismi'.toUpperCase(),
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("veri:" + widget.data.list[index].type),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/* import 'dart:convert';

import 'package:flutter/material.dart';
import 'category_menu.dart';
import 'griddashboard.dart';
import 'package:finder/veriler/model.dart';

class GridList extends StatefulWidget {
  //GridList({Key key, this.pokemon}) : super(key: key);

  //Items pokemon;
  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  List kategoriler;
  List<Kategori> detail;
  List<Lister> lister;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("assets/veriler.json"),
        builder: (context, cevap) {
          //FUTURE BUİLDER İÇERİSİNDE HASDATA KONTOLÜ DATA GELDİMİ GELMEDİMİ GELMEDİYSE
          if (cevap.hasData == false &&
              cevap.connectionState != ConnectionState.waiting) {
            //EKRANA BURAYI GÖSTER
            return Center(
              child: Text("Dosya okunamadı"),
            );
          } else if (cevap.connectionState == ConnectionState.waiting) {
            //EĞER DATA GELMİŞ VE YÜKLENİYORSA BURAYI GÖSTER
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //DATA YÜKLENDİYSE OLACAK KISIM
            kategoriler = jsonDecode(cevap.data);
            detail = kategoriler.map((e) => Kategori.fromJson(e)).toList();
            // lister = kategoriler.map((e) => ListClass.fromJson(e)).toList();

            return ListView.builder(
              itemBuilder: (BuildContext context, index) {
                Kategori detay = detail[index];
                debugPrint(detail.length.toString());
                /*lister = kategoriler[index]['list']['lister']
                    .map((e) => Lister.fromJson(e))
                    .toList();*/
               // Lister listdata = lister[index];
               // şimdilik burayı kategorilerin içerisinden alırmısın type acil cıkmam gerekiyor devam ederiz burda kalsın
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          child: Image.network(
                              'https://images.unsplash.com/photo-1583595975967-f402ed7a9416?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Text kismi'.toUpperCase(),
                                style: Theme.of(context).textTheme.title,
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("veri" + kategoriler[index]['list']['lister'][index]['type']),
                                  Text('125k views'),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: detail.length,
            );
          }
        },
      ),
    );
  }
}


 */
