import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:visit_sri_lanka_travel_guide_app/constants/keys.dart'; // secretKey here

class PaymentGateway {
  /// Creates a PaymentIntent using Stripe API
  static Future<Map<String, dynamic>?> createPaymentIntent(
      {required String amount}) async {
    final paymentInfo = {
      "amount": amount,
      "currency": "USD",
      "automatic_payment_methods[enabled]": "true",
    };

    try {
      final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: paymentInfo,
        headers: {
          "Authorization": "Bearer $secretKey", // ONLY for test
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Stripe error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception creating payment intent: $e");
      return null;
    }
  }

  /// Initializes and presents the Stripe payment sheet
  static Future<void> initAndPresentPaymentSheet(
      {required String clientSecret}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "Visit Sri Lanka",
          style: ThemeMode.light,
          allowsDelayedPaymentMethods: true,
        ),
      );

      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception("Stripe payment sheet failed: $e");
    }
  }
}
