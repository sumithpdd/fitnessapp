// import 'package:fitnessapp/helpers/config/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class Bannerad extends StatefulWidget {
//   @override
//   _BanneradState createState() => _BanneradState();
// }

// class _BanneradState extends State<Bannerad> {
//   BannerAd bAd = new BannerAd(
//     size: AdSize.banner,
//     adUnitId: 'ca-app-pub-3940256099942544/6300978111',
//     listener: BannerAdListener(onAdLoaded: (Ad ad) {
//       print("ad loaded");
//     }, onAdFailedToLoad: (Ad ad, LoadAdError errot) {
//       print("ad Failed");
//       ad.dispose();
//     }, onAdOpened: (Ad ad) {
//       print("ad opened");
//     }),
//     request: AdRequest(),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: getProportionateScreenHeight(50),
//       child: AdWidget(
//         ad: bAd..load(),
//         key: UniqueKey(),
//       ),
//     );
//   }
// }
