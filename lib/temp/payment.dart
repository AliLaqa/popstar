// // payment.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_apple_pay/flutter_apple_pay.dart';
// import 'package:popstar/share.dart';

// class PaymentScreen extends StatefulWidget {
  
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {


//   bool _isPaid = false;

// // Future<bool> isApplePayAvailable() async {
// //   return await FlutterApplePay.isAvailable;
// // }

//   Future<void> _makePayment() async {
//     // Set the price for the subscription
//     final double price = 9.99;

//     // Check if Apple Pay is available
//     // if (await isApplePayAvailable()) {
//     // Create a payment request
//     final PaymentItem paymentItem = PaymentItem(
//       label: 'Your App Subscription',
//       amount: price,
//     );

//     // Request payment
//     final dynamic response = await FlutterApplePay.makePayment(
//       countryCode: 'US',
//       currencyCode: 'USD',
//       paymentItems: [paymentItem],
//       merchantIdentifier: 'merchant.com.yourapp',
//     );

//     // Handle payment response
//     if (response['status'] == 'success') {
//       // Update user's subscription status and navigate to the result screen
//       _isPaid=true;
//                    Navigator.of(context).pop();
//     } else {
//       // Show an error message if the payment failed
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(response['message']),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//     // } else {
//     //   // Show an error message if Apple Pay is not available
//     //   showError('Apple Pay is not available on this device.');
//     // }

//     setState(() {
//       _isPaid = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 2, 2, 17),
//         title: Text('Payment'),
//       ),
//       body: Center(
//         child: _isPaid
//             ? Text(
//                 'You are now a paid user.',
//                 style: TextStyle(fontSize: 24),
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Please make a payment to unlock the full feature.',
//                     style: TextStyle(fontSize: 24),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _makePayment,
//                     child: Text('Make Payment'),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
