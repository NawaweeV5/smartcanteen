import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminShop extends StatefulWidget {
  const AdminShop({super.key});

  @override
  State<AdminShop> createState() => _AdminShopState();
}

class _AdminShopState extends State<AdminShop> {
  final CollectionReference _shop =
      FirebaseFirestore.instance.collection('shop');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: StreamBuilder(
        stream: _shop.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];

                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        documentSnapshot['sname'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text(documentSnapshot['description'].toString()),
                      leading: Image.asset("images/food.jpg"),
                    ),
                  ),
                );
                // return Card(
                //   margin: const EdgeInsets.all(10),
                //   child: ListTile(
                //     title: Text(documentSnapshot['sname']),
                //     subtitle: Text(documentSnapshot['description'].toString()),
                //   ),
                // );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
