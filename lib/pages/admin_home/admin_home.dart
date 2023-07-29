import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  // text field controller
  final TextEditingController _snameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _snController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final CollectionReference _shop =
      FirebaseFirestore.instance.collection('shop');

  String searchText = '';
  // for create operation
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Create shop",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _snController,
                  decoration: const InputDecoration(
                      labelText: 'sn', hintText: 'eg.Elon'),
                ),
                TextField(
                  controller: _snameController,
                  decoration: const InputDecoration(
                      labelText: 'sname', hintText: 'eg.Elon'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      labelText: 'description', hintText: 'eg.Elon'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String sname = _snameController.text;
                    final String description = _descriptionController.text;
                    final String sn = _snController.text;
                    if (sn != null) {
                      await _shop.add({
                        "sname": sname,
                        "description": description,
                        "sn": sn
                      });
                      _snameController.text = '';
                      _descriptionController.text = '';
                      _snController.text = '';

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Create"),
                ),
              ],
            ),
          );
        });
  }

  // for update operation
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _snameController.text = documentSnapshot['sname'];
      _descriptionController.text = documentSnapshot['description'];
      _snController.text = documentSnapshot['sn'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "update shop",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _snController,
                  decoration: const InputDecoration(
                      labelText: 'sn', hintText: 'eg.Elon'),
                ),
                TextField(
                  controller: _snameController,
                  decoration: const InputDecoration(
                      labelText: 'sname', hintText: 'eg.Elon'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      labelText: 'description', hintText: 'eg.Elon'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String sname = _snameController.text;
                    final String description = _descriptionController.text;
                    final int? sn = int.tryParse(_snController.text);
                    if (sn != null) {
                      await _shop.doc(documentSnapshot!.id).update({
                        "sname": sname,
                        "description": description,
                        "sn": sn
                      });
                      _snameController.text = '';
                      _descriptionController.text = '';
                      _snController.text = '';

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Update"),
                ),
              ],
            ),
          );
        });
  }

  // for delete operation
  Future<void> _delete(String ProductID) async {
    await _shop.doc(ProductID).delete();

    // for snackBar
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Delete shop success")));
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  bool isSearchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        shadowColor: Colors.transparent,
        title: isSearchClicked
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    hintText: 'Search...',
                  ),
                ),
              )
            : const Text("Insert Shop"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                });
              },
              icon: Icon(isSearchClicked ? Icons.close : Icons.search))
        ],
      ),
      body: StreamBuilder(
        stream: _shop.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
          if (streamSnapShot.hasData) {
            final List<DocumentSnapshot> shop = streamSnapShot.data!.docs
                .where((doc) => doc['sname'].toLowerCase().contains(
                      searchText.toLowerCase(),
                    ))
                .toList();
            return ListView.builder(
              itemCount: shop.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = shop[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: Text(
                        documentSnapshot['sn'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    title: Text(
                      documentSnapshot['sname'],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      documentSnapshot['description'],
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => _update(documentSnapshot),
                            color: Colors.black,
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => _delete(documentSnapshot.id),
                            color: Colors.black,
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ), // Move the closing parenthesis to this position
                );
              },
            );
          }
          return const Center();
        },
      ),
      // create new project button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
