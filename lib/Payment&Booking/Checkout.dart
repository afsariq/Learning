import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void initState() {
    super.initState();
  }

  void showAlert(BuildContext context, String title, String msg) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void startOneTimePayment(BuildContext context) async {
    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "merchant_id": "1218302", // Replace your Merchant ID
      "merchant_secret": "8VyoXGh6g8D8glsS0OzeCP8m4OJEs9epb8MSNX6vn9jY",
      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
      "order_id": "ItemNo12345",
      "items": "Hello from Flutter!",
      "amount": "50.00",
      "currency": "LKR",
      "first_name": "Saman",
      "last_name": "Perera",
      "email": "samanp@gmail.com",
      "phone": "0771234567",
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
      "delivery_address": "No. 46, Galle road, Kalutara South",
      "delivery_city": "Kalutara",
      "delivery_country": "Sri Lanka",
      "custom_1": "",
      "custom_2": ""
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      print("One Time Payment Success. Payment Id: $paymentId");
      showAlert(context, "Payment Success!", "Payment Id: $paymentId");
    }, (error) {
      print("One Time Payment Failed. Error: $error");
      showAlert(context, "Payment Failed", "$error");
    }, () {
      print("One Time Payment Dismissed");
      showAlert(context, "Payment Dismissed", "");
    });
  }

  // void startRecurringPayment(BuildContext context) async{
  //   Map paymentObject = {
  //     "sandbox": true,                 // true if using Sandbox Merchant ID
  //     "merchant_id": "1211149",        // Replace your Merchant ID
  //     "merchant_secret": "4uS83EVTOml4DxK0pruz0K8MPXVBpMuLE8m4bfpiWHBf",
  //     "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
  //     "order_id": "ItemNo12345",
  //     "items": "Hello from Flutter!",
  //     "amount": "50.00",
  //     "recurrence": "1 Month",         // Recurring payment frequency
  //     "duration": "1 Year",            // Recurring payment duration
  //     "currency": "LKR",
  //     "first_name": "Saman",
  //     "last_name": "Perera",
  //     "email": "samanp@gmail.com",
  //     "phone": "0771234567",
  //     "address": "No.1, Galle Road",
  //     "city": "Colombo",
  //     "country": "Sri Lanka",
  //     "delivery_address": "No. 46, Galle road, Kalutara South",
  //     "delivery_city": "Kalutara",
  //     "delivery_country": "Sri Lanka",
  //     "custom_1": "",
  //     "custom_2": ""
  //   };

  //   PayHere.startPayment(
  //     paymentObject, (paymentId) {
  //       print("Recurring Payment Success. Payment Id: $paymentId");
  //       showAlert(context, "Payment Success!", "Payment Id: $paymentId");
  //     }, (error) {
  //       print("Recurring Payment Failed. Error: $error");
  //       showAlert(context, "Payment Failed", "$error");
  //     }, () {
  //       print("Recurring Payment Dismissed");
  //       showAlert(context, "Payment Dismissed", "");
  //     }
  //   );
  // }//recurring

  void startTokenizationPayment(BuildContext context) async {
    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "preapprove": true, // Required
      "merchant_id": "1211149", // Replace your Merchant ID
      "merchant_secret": "4uS83EVTOml4DxK0pruz0K8MPXVBpMuLE8m4bfpiWHBf",
      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
      "order_id": "ItemNo12345",
      "items": "Hello from Flutter!",
      "currency": "LKR",
      "first_name": "Saman",
      "last_name": "Perera",
      "email": "samanp@gmail.com",
      "phone": "0771234567",
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      print("Tokenization Payment Success. Payment Id: $paymentId");
      showAlert(context, "Payment Success!", "Payment Id: $paymentId");
    }, (error) {
      print("Tokenization Payment Failed. Error: $error");
      showAlert(context, "Payment Failed", "$error");
    }, () {
      print("Tokenization Payment Dismissed");
      showAlert(context, "Payment Dismissed", "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Confirmation'),
        backgroundColor: Color(0xff00007c),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffe6e6ff),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),

                //class details
                child: Column(
                  children: [
                    Text(
                      'Class Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Hamna',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '28/06/2021',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '11.30 - 1.30',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.book_outlined,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ICT',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffccccff),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),

                //Total Fee
                child: Column(
                  children: [
                    Text(
                      'Total Fee',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.money_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'LKR 1500.00',
                          style: TextStyle(color: Colors.black, fontSize: 26, letterSpacing: 3),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                startOneTimePayment(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff00007c),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30)
                ),
              ),
              child: Text('Confirm and Pay')),
          // TextButton(
          //   onPressed: () { startRecurringPayment(context); },
          //   child: Text('Start Recurring Payment!')),
          // TextButton(
          //     onPressed: () {
          //       startTokenizationPayment(context);
          //     },
          //     child: Text('Start Tokenization Payment!')),
        ],
      ),
    );
  }
}
