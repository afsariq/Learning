import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key key}) : super(key: key);

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment History"),
        backgroundColor: Color(0xff00007c),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Students')
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection('Payment')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.docs.map((document) {
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade400,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  // width: MediaQuery.of(context).size.width / 1.2,
                  // height: MediaQuery.of(context).size.width / 6,
                  // child: Text("Amount: " + document['Amount']),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            document['TeacherName'],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            document['Date'],
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Rs. ' + document['Amount'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
