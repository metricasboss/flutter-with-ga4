import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const bool.fromEnvironment('FIRDebugEnabled', defaultValue: true);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Analytics - Purchase Event'),
        ),
        body: const Center(
          child: PurchaseButton(),
        ),
      ),
    );
  }
}

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        FirebaseAnalytics analytics = FirebaseAnalytics.instance;

        await FirebaseAnalytics.instance
      .logBeginCheckout(
        value: 10.0,
        currency: 'USD',
        items: [
          AnalyticsEventItem(
            itemName: 'Socks',
            itemId: 'xjw73ndnw',
            price: 10.0
          ),
        ],
        coupon: '10PERCENTOFF'
      );


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Evento de compra registrado!')),
        );
      },
      child: const Text('Simular Compra'),
    );
  }
}
