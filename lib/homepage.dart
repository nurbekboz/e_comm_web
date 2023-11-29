import 'dart:io';
import 'dart:ui';

// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import 'package:fhm_globsl/destek.dart';
import 'package:fhm_globsl/gizlilikpolitikasi.dart';
import 'package:fhm_globsl/hakk%C4%B1nda.dart';
import 'package:fhm_globsl/locator.dart';
import 'package:fhm_globsl/service/network_status_service.dart';
import 'package:fhm_globsl/service/push_notification_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bottombar/anasayfa.dart';


class HomeNavigator extends StatefulWidget {
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DarkLightTheme(scaffoldKey: _scaffoldKey);
  }
}

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> with SingleTickerProviderStateMixin {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();
  int _currentindex = 0;
  final tabs = [
    // Anasayfa(),
    // Firmalar(),
    // Bakiye(),
    // Ayarlar(),
  ];

  void initState() {
    locator<PushNotificationService>().init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: widget._scaffoldKey,
        extendBodyBehindAppBar: false,
        endDrawer: _drawer(context),
        body: Consumer<NetworkStatus>(builder: (context, data, child) {
          return data == NetworkStatus.Online
              ? tabs[currentPage]
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off,
                        color: Colors.white70,
                        size: 36,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Check your internet connection!",
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white70),
                      ),
                    ],
                  ),
                );
        }),
        floatingActionButton: GestureDetector(
          onTap: () {
            _urlAc('https://api.whatsapp.com/send/?phone=905312259507&text&type=phone_number&app_absent=0');
          },
          child: Padding(
            padding: const EdgeInsets.only(
              bottom:50.0,
            ),
            child: Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                color: Color(0xfff2ECC71),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/whatsapp2.png',
                    scale: 27,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Whatsapp !',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      ),
    );
  }

  Column _drawer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Drawer(
            child: Container(
              color: Color(0xfff0E1117),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      DrawerHeader(
                        child: Image.asset(
                          'assets/trend.png',
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Tarayıcıda Aç",
                          style: TextStyle(
                            fontFamily: "Arial",
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          ),
                        ),
                        leading: Icon(Icons.language, color: Theme.of(context).textTheme.bodyText1?.color),
                        onTap: () {
                          // if (ReklamMiktari.ReklamSayisi % 101 == 0) {
                          //   ReklamMiktari.ReklamSayisi =
                          //       ReklamMiktari.ReklamSayisi + 1;
                          // } else {
                          //   newAdd.show(
                          //       anchorType: AnchorType.bottom,
                          //       anchorOffset: 0.0,
                          //       horizontalCenterOffset: 0.0);
                          // }
                          _urlAc('https://www.mavikus.com.tr/store/');
                        },
                      ),
                      // Divider(
                      //   color: Theme.of(context).secondaryHeaderColor,
                      // ),
                      // ListTile(
                      //   title: Text(
                      //     "Emlak",
                      //     style: TextStyle(
                      //       fontFamily: "Arial",
                      //       color:
                      //           Theme.of(context).textTheme.bodyText1?.color,
                      //     ),
                      //   ),
                      //   leading: Icon(Icons.home,
                      //       color: Theme.of(context)
                      //           .textTheme
                      //           .bodyText1
                      //           .color),
                      //   onTap: () {
                      //     if (ReklamMiktari.ReklamSayisi % 101 == 0) {
                      //       ReklamMiktari.ReklamSayisi =
                      //           ReklamMiktari.ReklamSayisi + 1;
                      //     } else {
                      //       newAdd.show(
                      //           anchorType: AnchorType.bottom,
                      //           anchorOffset: 0.0,
                      //           horizontalCenterOffset: 0.0);
                      //     }
                      //     _urlAc('https://firmakayitlari.com/emlak');
                      //   },
                      // ),
                      // Divider(
                      //   color: Theme.of(context).secondaryHeaderColor,
                      // ),
                      // ListTile(
                      //   title: Text(
                      //     "İletişim",
                      //     style: TextStyle(
                      //       fontFamily: "Arial",
                      //       color: Theme.of(context).textTheme.bodyText1?.color,
                      //     ),
                      //   ),
                      //   leading: Icon(Icons.wechat_sharp, color: Theme.of(context).textTheme.bodyText1?.color),
                      //   onTap: () {
                      //     _urlAc('https://api.whatsapp.com/send/?phone=905362936408&text&type=phone_number&app_absent=0');
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) => Destek()));
                      //   },
                      // ),
                      Divider(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      ListTile(
                        title: Text(
                          "Gizlilik Politikası",
                          style: TextStyle(
                            fontFamily: "Arial",
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          ),
                        ),
                        leading: Icon(Icons.security, color: Theme.of(context).textTheme.bodyText1?.color),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GizlililikPolitikasi()));
                        },
                      ),
                      Divider(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      // Divider(
                      //   color: Theme.of(context).secondaryHeaderColor,
                      // ),
                      // ListTile(
                      //   title: Text(
                      //     "Kullanım Koşulları",
                      //     style: TextStyle(
                      //       fontFamily: "Arial",
                      //       color:
                      //           Theme.of(context).textTheme.bodyText1?.color,
                      //     ),
                      //   ),
                      //   leading: Icon(Icons.help_outline_sharp,
                      //       color: Theme.of(context)
                      //           .textTheme
                      //           .bodyText1
                      //           .color),
                      //   onTap: () {
                      //     if (ReklamMiktari.ReklamSayisi % 101 == 0) {
                      //       ReklamMiktari.ReklamSayisi =
                      //           ReklamMiktari.ReklamSayisi + 1;
                      //     } else {
                      //       newAdd.show(
                      //           anchorType: AnchorType.bottom,
                      //           anchorOffset: 0.0,
                      //           horizontalCenterOffset: 0.0);
                      //     }
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 KullanimKosullari()));
                      //   },
                      // ),
                      // Divider(
                      //   color: Theme.of(context).secondaryHeaderColor,
                      // ),
                      /*     ListTile(
                        title: Text(
                          "Ayarlar",
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(Icons.settings, color: Colors.white),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Ayarlarim()));
                        },
                      ),
                      Divider(
                        color: Colors.white,
                      ),*/
                      ListTile(
                        title: Text(
                          "Değerlendir/Puan Ver!",
                          style: TextStyle(
                            fontFamily: "Arial",
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          ),
                        ),
                        leading: Icon(Icons.thumb_up, color: Theme.of(context).textTheme.bodyText1?.color),
                        onTap: () {
                          _urlAc('https://play.google.com');
                        },
                      ),
                      Divider(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      ListTile(
                        title: Text(
                          "Arkadaşına Öner!",
                          style: TextStyle(fontFamily: "Arial", color: Theme.of(context).textTheme.bodyText1?.color),
                        ),
                        leading: Icon(Icons.share, color: Theme.of(context).textTheme.bodyText1?.color),
                        onTap: () {
                          paylas();
                        },
                      ),
                      Divider(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,
                              bottom: 4,
                            ),
                            child: Text("Bizi sosyal medyadan takip edin!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, color: Theme.of(context).textTheme.bodyText1?.color)),
                          ),
                          Divider(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _urlAc("https://www.facebook.com/aofilahiyathazirlik");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    height: 36,
                                    width: 36,
                                    child: Image.asset(
                                      "assets/facebook.png",
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                color: Theme.of(context).secondaryHeaderColor,
                                width: 1,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _urlAc("https://www.instagram.com/aofilahiyathazirlik/");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    height: 36,
                                    width: 36,
                                    child: Image.asset(
                                      "assets/instagram.png",
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                color: Theme.of(context).secondaryHeaderColor,
                                width: 1,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _urlAc("https://twitter.com/");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    height: 36,
                                    width: 36,
                                    child: Image.asset(
                                      "assets/x.png",
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                color: Theme.of(context).secondaryHeaderColor,
                                width: 1,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _urlAc("youtube.com");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    height: 36,
                                    width: 36,
                                    child: Image.asset(
                                      "assets/youtube.png",
                                      color: Colors.white70,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                color: Theme.of(context).secondaryHeaderColor,
                                width: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 1),
                        width: MediaQuery.of(context).size.width * .72,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "Tüm sosyal medya hizmetleri tek platformda!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Arial",
                                          fontSize: 13,
                                          color: Theme.of(context).textTheme.bodyText1?.color),
                                    ),
                                  ),
                                  // Text(
                                  //   "\ninfo@testmail.com\n",
                                  //   textAlign: TextAlign.center,
                                  //   style: TextStyle(
                                  //       fontWeight: FontWeight.w700,
                                  //       fontFamily: "Arial",
                                  //       fontSize: 16,
                                  //       color: Theme.of(context).textTheme.bodyText1?.color),
                                  // ),
                                  // Text(
                                  //   "Bize ulaşın!",
                                  //   textAlign: TextAlign.center,
                                  //   style: TextStyle(
                                  //       fontFamily: "Arial",
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w400,
                                  //       color: Theme.of(context).textTheme.bodyText1?.color),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  /* Positioned(
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1),
                        width: MediaQuery.of(context).size.width * .72,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Öneri ve şikayetleriniz için",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Arial",
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color),
                                  ),
                                  Text(
                                    "firmareklami05@gmail.com",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Arial",
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color),
                                  ),
                                  Text(
                                    "Bize ulaşın!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Arial",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),*/
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> paylas() async {
    await FlutterShare.share(
        title: "Paylaş",
        text: "Bu linkten uygulamamızı indirebilirsiniz : ",
        linkUrl: "https://play.google.com",
        chooserTitle: "Uygulamayı paylaş");
  }

  Future _urlAc(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      debugPrint('gönderdiğin linki açamıyorum');
    }
  }
}
