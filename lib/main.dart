import 'package:flutter/material.dart';
import 'package:pdf_create/pdfCreate.dart';
import 'package:pdf_create/pdf_viewer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Anasayfa(), );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

   List<List<String>> tabloElemanlari = new List();
List<String> basliklar = [
    "tablo baslik sutun1",
    "tablo baslik sutun2",
    "tablo baslik sutun3",
    "tablo baslik sutun4"
  ];
  List<String> tabloSatir1 = [
    "tablo satir1 sutun1",
    "tablo satir1 sutun2",
    "tablo satir1 sutun3",
    "tablo satir1 sutun4"
  ];

  List<String> tabloSatir2 = [
    "tablo satir2 sutun1",
    "tablo satir2 sutun2",
    "tablo satir2 sutun3",
    "tablo satir2 sutun4"
  ];

  List<String> tabloSatir3 = [
    "tablo satir3 sutun1",
    "tablo satir3 sutun2",
    "tablo satir3 sutun3",
    "tablo satir3 sutun4"
  ];

  List<String> tabloSatir4 = [
    "tablo satir4 sutun1",
    "tablo satir4 sutun2",
    "tablo satir4 sutun3",
    "tablo satir4 sutun4"
  ];

  List<String> tabloSatir5 = [
    "tablo satir5 sutun1",
    "tablo satir5 sutun2",
    "tablo satir5 sutun3",
    "tablo satir5 sutun4"
  ];

  List<String> tabloSatir6 = [
    "tablo satir6 sutun1",
    "tablo satir6 sutun2",
    "tablo satir6 sutun3",
    "tablo satir6 sutun4"
  ];

  List<String> listeElemanlari = [
    "liste madde1",
    "liste madde2",
    "liste madde3",
    "liste madde4",
    "liste madde5",
    "liste madde6",
  ];

  String paragraf =
      "Parlak mavi ayın parıltılı ışığı şelaleden düşen sudan yansıyarak sol gözünde belirsiz şekillerin oluşmasıyla korkunç ve devasa halisülasyonlar görmesi nedenlerinden oluşan bir dizi sanrılar hayatının en genç ve en körpe yıllarını zehir zembelek etmeye yetti. ";

@override
  void initState() {
    super.initState();
    tabloElemanlari.add(basliklar);
    tabloElemanlari.add(tabloSatir1);
    tabloElemanlari.add(tabloSatir2);
    tabloElemanlari.add(tabloSatir3);
    tabloElemanlari.add(tabloSatir4);
    tabloElemanlari.add(tabloSatir5);
    tabloElemanlari.add(tabloSatir6);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PDF Create by avdisx"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Pdf Oluştur./PDF Create"),
            onPressed: () async {
                            // pdf gönderme bölümü

                            //bekleme ekranına yönlendir.
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Scaffold(
                                body: Container(
                                  //color: Color.fromRGBO(0, 179, 134, 1.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "PDF oluşturuluyor...",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        CircularProgressIndicator(),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));

                            List veriler = List();
                            
                            print(veriler.length.toString() +
                                " veri listesi sayısı");
                            String pth = await pdfOlustur(tabloElemanlari,
                                listeElemanlari, paragraf,"by avdisx");
                            /* Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PdfViewerPage(pth), */
                            Navigator.pop(context);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SonuclarPDFEkrani(
                                  path: pth,
                                  baslik: "by avdisx",
                                ),
                              ),
                            );
                          },
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      );
    
  }
}