import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static void loadAd(Function(InterstitialAd) onLoaded) {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3795603157334337/5621862260',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onLoaded,
        onAdFailedToLoad: (_) {},
      ),
    );
  }
}
