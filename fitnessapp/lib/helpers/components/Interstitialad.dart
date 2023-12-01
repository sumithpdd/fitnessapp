// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class InterstialAd {
//   late InterstitialAd _interstitialAd;

//   // ignore: non_constant_identifier_names
//   int num_of_attemp_load = 0;

//   static initialization() {
//     if (MobileAds.instance == null) {
//       MobileAds.instance.initialize();
//     }
//   }

//   void createInterad() {
//     InterstitialAd.load(
//       adUnitId: 'ca-app-pub-3940256099942544/1033173712',
//       request: AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           _interstitialAd = ad;
//           num_of_attemp_load = 0;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           num_of_attemp_load++;

//           if (num_of_attemp_load <= 2) {
//             createInterad();
//           }
//         },
//       ),
//     );
//   }

//   void showInterad() {
//     if (_interstitialAd == null) {
//       return;
//     }
//     _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
//         onAdShowedFullScreenContent: (InterstitialAd ad) {
//       print("Ad showed full screen");
//     }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
//       print("Ad disposed");
//       ad.dispose();
//     }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
//       print('$ad Onadfailed $aderror');
//       ad.dispose();
//       createInterad();
//     });
//     _interstitialAd.show();
//   }
// }
