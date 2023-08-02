import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAccountUsers extends StatefulWidget {
  const AdminAccountUsers({super.key});

  @override
  State<AdminAccountUsers> createState() => _AdminAccountUsersState();
}

class _AdminAccountUsersState extends State<AdminAccountUsers> {
  final TextEditingController _UsernameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  String searchText = '';

  // for update operation
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _UsernameController.text = documentSnapshot['Username'];
      _EmailController.text = documentSnapshot['Email'];
      _PasswordController.text = documentSnapshot['Password'];
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
                    "update user",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _PasswordController,
                  decoration: const InputDecoration(
                      labelText: 'Password', hintText: 'Password'),
                ),
                TextField(
                  controller: _UsernameController,
                  decoration: const InputDecoration(
                      labelText: 'Username', hintText: 'Username'),
                ),
                TextField(
                  controller: _EmailController,
                  decoration: const InputDecoration(
                      labelText: 'Email', hintText: 'Email'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String Username = _UsernameController.text;
                    final String Email = _EmailController.text;
                    final String Password = _PasswordController.text;
                    if (Password != null) {
                      await _users.doc(documentSnapshot!.id).update({
                        "Username": Username,
                        "Email": Email,
                        "Password": Password
                      });
                      _UsernameController.text = '';
                      _EmailController.text = '';
                      _PasswordController.text = '';

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
    await _users.doc(ProductID).delete();

    // for snackBar
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Delete user success")));
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
            : const Text("Users"),
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
        stream: _users.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
          if (streamSnapShot.hasData) {
            final List<DocumentSnapshot> user = streamSnapShot.data!.docs
                .where((doc) => doc['Username'].toLowerCase().contains(
                      searchText.toLowerCase(),
                    ))
                .toList();
            return ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = user[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    // leading: CircleAvatar(
                    //   radius: 30,
                    //   backgroundColor: Colors.blue,
                    //   child: Text(
                    //     documentSnapshot['Password'].toString(),
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, color: Colors.black),
                    //   ),
                    // ),
                    title: Text(
                      documentSnapshot['Username'],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      documentSnapshot['Email'],
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
    );
  }
}
