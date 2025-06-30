import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../widgets/base_selector.dart';
import '../widgets/input_display.dart';
import '../widgets/output_display.dart';
import '../widgets/input_buttons.dart';
import '../utils/converter.dart';
import '../services/ad_service.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> with SingleTickerProviderStateMixin {
  int inputBase = 2;
  int outputBase = 10;
  String input = '';
  int clickCount = 0;
  InterstitialAd? _interstitialAd;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    AdService.loadAd((ad) => _interstitialAd = ad);
  }

  void _showAdIfNeeded() {
    clickCount++;
    if (clickCount >= 10 && _interstitialAd != null) {
      _interstitialAd!.show();
      AdService.loadAd((ad) => _interstitialAd = ad);
      clickCount = 0;
    }
  }

  void _updateInput(String value) {
    setState(() {
      input += value;
      _controller.forward(from: 0);
    });
    _showAdIfNeeded();
  }

  void _clearInput() {
    setState(() => input = '');
  }

  @override
  Widget build(BuildContext context) {
    final output = convertBase(input, inputBase, outputBase);

    return Scaffold(
      appBar: AppBar(
        title: const Text('🧮 Base Converter'),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BaseSelector(
              inputBase: inputBase,
              outputBase: outputBase,
              onInputChanged: (val) => setState(() {
                inputBase = val!;
                input = '';
              }),
              onOutputChanged: (val) => setState(() => outputBase = val!),
            ),
            const SizedBox(height: 20),
            InputDisplay(value: input, onClear: _clearInput),
            const SizedBox(height: 20),
            OutputDisplay(value: output, animation: _controller),
            const SizedBox(height: 20),
            Expanded(
              child: InputButtons(
                base: inputBase,
                onPressed: _updateInput,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }
}