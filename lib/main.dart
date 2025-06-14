import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Homepage.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/Tours_provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/booking_provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/event_provider.dart';

import 'package:visit_sri_lanka_travel_guide_app/Providers/places_provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Screens/Authetication%20Screens/auth_screen.dart';
import 'package:visit_sri_lanka_travel_guide_app/constants/keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlacesProvider()),
        ChangeNotifierProvider(create: (_) => ToursProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vist Sri Lanka',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snap) {
              if (snap.data == null) {
                return const AuthScreen();
              } else {
                return const Homepage();
              }
            }));
  }
}
