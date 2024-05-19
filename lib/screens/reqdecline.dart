import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestandDecline extends StatefulWidget {
  const RequestandDecline({super.key});

  @override
  State<RequestandDecline> createState() => _RequestandDeclineState();
}

class _RequestandDeclineState extends State<RequestandDecline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Approval",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Contacts")
                  .where("request", isEqualTo: "pending")
                  .snapshots(),
              builder: (context, snapshot) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(snapshot.data!.docs[index]["Name"]),
                          subtitle: Text(snapshot.data!.docs[index]["Number"]),
                          trailing: Container(
                            alignment: Alignment.topRight,
                            height: 50,
                            width: 100,
                            child: Row(children: [
                              IconButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("Contacts")
                                      .doc(snapshot.data!.docs[index].id)
                                      .update({"request": "approved"});
                                },
                                icon: const Icon(Icons.done_rounded),
                              ),
                              IconButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("Contacts")
                                      .doc(snapshot.data!.docs[index].id)
                                      .update({"request": "denied"});
                                },
                                icon: const Icon(Icons.close_outlined),
                              ),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Contacts")
                  .where("request", isEqualTo: "denied")
                  .snapshots(),
              builder: (context, snapshot) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            snapshot.data!.docs[index]["Name"],
                            style: const TextStyle(color: Colors.red),
                          ),
                          subtitle: Text(
                            snapshot.data!.docs[index]["Number"],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection("Contacts")
//                   .where("request", isEqualTo: "approved")
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Text(
//                           "Progress",
//                           style: TextStyle(fontSize: 30),
//                         ),
//                       ),
//                       ListView.builder(
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ListTile(
//                               title: Text(snapshot.data!.docs[index]["Name"]),
//                               subtitle:
//                                   Text(snapshot.data!.docs[index]["Number"]),
//                               trailing: Container(
//                                 alignment: Alignment.topRight,
//                                 height: 50,
//                                 width: 100,
//                                 child: Row(children: [
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(Icons.done_outline_rounded),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(Icons.close),
//                                   ),
//                                 ]),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
        ],
      ),
    );
  }
}
