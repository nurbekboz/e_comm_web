import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3000), () async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi_off),
                    const Text(
                      "İnternet bağlantınızı kontrol edin",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            });
        return;
      }
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Material(
      child: Container(
        color: Colors.white,
        child: Center(
            child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logow.jpeg',
                        scale: 5,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom:48.0),
                  child: CircularProgressIndicator(color: Colors.blueAccent,),
                )
                // const Padding(
                //   padding: const EdgeInsets.only(bottom: 36.0),
                //   child: Text(
                //     "Tüm hizmetleri tek platformda!",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 14),
                //   ),
                // )
              ],
            ),
          ],
        )),
      ),
    );
  }
}


