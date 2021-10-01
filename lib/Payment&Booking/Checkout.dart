import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsist/HomeScreen/Home.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';
import 'package:random_string/random_string.dart';

import 'BookingNew.dart';

class Checkout extends StatefulWidget {
  String id;
  String bookSub;
  String bookgrd;
  String techname;
  String date;
  String day; // eg: Monday, Tuesday

  var docId;

  Checkout({
    @required this.id,
    @required this.bookSub,
    @required this.bookgrd,
    @required this.techname,
    @required this.date,
    @required this.day,
  });

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var teacherDocument;
  double classFee;
  String docId;

  var student = FirebaseFirestore.instance
      .collection('Student')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .snapshots();

  @override
  void initState() {
    super.initState();
  }

  void showAlert(BuildContext context, String title, String msg) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
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

  void inputData() {
    FirebaseFirestore.instance
        .collection('Teacher')
        .doc(widget.id)
        .collection('ClassTimes')
        .doc(widget.day) //give the proper date
        .update({Field: 'Booked'});

    FirebaseFirestore.instance
        .collection('Teacher')
        .doc(widget.id)
        .collection('Booked Classes')
        .doc()
        .set({
      'Time': widget.day + selectedTime,
      'User': FirebaseAuth.instance.currentUser.uid,
      'Link': 'join' + FirebaseAuth.instance.currentUser.uid,
      'Date': widget.date,
      'Subject': widget.bookSub,
      'Grade': widget.bookgrd
      //'Link': Room
    });

    FirebaseFirestore.instance
        .collection('Students')
        .doc(
          FirebaseAuth.instance.currentUser.uid,
        )
        .collection('Booked Classes')
        .doc(docId)
        .set({
      'Time': 'Monday' + selectedTime,
      'Link': 'join' + FirebaseAuth.instance.currentUser.uid,
      'Teacher': widget.techname,
      'subject': widget.bookSub,
      'Date': widget.date,
    });

    print('---------data uploaded in firestore-----------');
  }

  void startOneTimePayment(BuildContext context) async {
    var username;
    var phone;
    docId = randomString(20);
    var collection = FirebaseFirestore.instance.collection('Students');
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> studentDocument = docSnapshot.data();
      username = studentDocument['UserName'];
      phone = studentDocument['Phone'];
    } else
      print('------- student document NOT existing');

    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "merchant_id": "1218302", // Replace your Merchant ID
      "merchant_secret": "8VyoXGh6g8D8glsS0OzeCP8m4OJEs9epb8MSNX6vn9jY",
      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
      "order_id": randomString(15),
      "items": docId, // doc id of booked class in students collection
      "amount": classFee,
      "currency": "LKR",
      "first_name": username,
      "last_name": " ",
      "email": FirebaseAuth.instance.currentUser.email,
      "phone": phone,
      "address": "",
      "city": "",
      "country": "Sri Lanka",
      "delivery_address": "",
      "delivery_city": "",
      "delivery_country": "",
      "custom_1": "",
      "custom_2": ""
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      print(
          "-------------One Time Payment Success. Payment Id: $paymentId  ------------------");
      inputData();
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

  // void startTokenizationPayment(BuildContext context) async {
  //   Map paymentObject = {
  //     "sandbox": true, // true if using Sandbox Merchant ID
  //     "preapprove": true, // Required
  //     "merchant_id": "1211149", // Replace your Merchant ID
  //     "merchant_secret": "4uS83EVTOml4DxK0pruz0K8MPXVBpMuLE8m4bfpiWHBf",
  //     "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
  //     "order_id": "ItemNo12345",
  //     "items": "Hello from Flutter!",
  //     "currency": "LKR",
  //     "first_name": "Saman",
  //     "last_name": "Perera",
  //     "email": "samanp@gmail.com",
  //     "phone": "0771234567",
  //     "address": "No.1, Galle Road",
  //     "city": "Colombo",
  //     "country": "Sri Lanka",
  //   };

  //   PayHere.startPayment(paymentObject, (paymentId) {
  //     print("Tokenization Payment Success. Payment Id: $paymentId");
  //     showAlert(context, "Payment Success!", "Payment Id: $paymentId");
  //   }, (error) {
  //     print("Tokenization Payment Failed. Error: $error");
  //     showAlert(context, "Payment Failed", "$error");
  //   }, () {
  //     print("Tokenization Payment Dismissed");
  //     showAlert(context, "Payment Dismissed", "");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher")
            .doc(widget.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (!snapshot.hasData) {
            return new Text("Loading");
          }

          teacherDocument = snapshot.data;

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
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
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
                                teacherDocument["Name"],
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
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
                                widget.day + '  ' + widget.date,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
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
                                selectedTime,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
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
                                widget.bookSub,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
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
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
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
                                calculateClassFee(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    letterSpacing: 3),
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
                          borderRadius: new BorderRadius.circular(30)),
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
        });
  }

  String calculateClassFee() {
    String feePerHour = teacherDocument['ClassFee'];
    double duration;

    switch (selectedDuration) {
      case '1 hr':
        duration = 1;
        break;
      case '1 hr 30 min':
        duration = 1.5;
        break;
      case '2 hr':
        duration = 2;
        break;
      case '2 hr 30 min':
        duration = 2.5;
        break;
      case '3 hr':
        duration = 3;
        break;
    }

    classFee = duration * double.parse(feePerHour);
    return classFee.toString();
  }
}
