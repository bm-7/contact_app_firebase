import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Serachbox extends StatefulWidget {
  const Serachbox({super.key});

  @override
  State<Serachbox> createState() => _SerachboxState();
}

class _SerachboxState extends State<Serachbox> {
  TextEditingController ControllerS = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: TextField(
              controller: ControllerS,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
              ),
              decoration: InputDecoration(
                  hintText: "Search here",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        ControllerS.clear();
                      },
                      icon: const Icon(Icons.clear))),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
        body: ControllerS.text.isEmpty
            ? StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Contacts")
                    .where("request", isEqualTo: "approved")  
                    .snapshots(),
                builder: (context, snapshot) {
                  int length = snapshot.data!.docs.length;
                  return ListView.builder(
                      itemCount: length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data!.docs[index]["Name"]),
                          subtitle: Text(snapshot.data!.docs[index]["Number"]),
                        );
                      });
                },
              )
            : StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Contacts")
                    .snapshots(),
                builder: (context, snapshot) {
                  int length = snapshot.data!.docs.length;
                  return ListView.builder(
                    itemCount: length,
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot.data!.docs[index]["Name"]
                              .toString()
                              .toLowerCase()
                              .contains(ControllerS.text.toLowerCase()) ||
                          snapshot.data!.docs[index]["Number"]
                              .toString()
                              .toLowerCase()
                              .contains(ControllerS.text)) {
                        return ListTile(
                          title: Text(snapshot.data!.docs[index]["Name"]),
                          subtitle: Text(snapshot.data!.docs[index]["Number"]),
                          onTap: () {},
                        );
                      }
                    },
                  );
                },
              ));
  }
}
