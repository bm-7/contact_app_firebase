import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app_firebase/screens/reqdecline.dart';
import 'package:contact_app_firebase/screens/sezrchbox.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController numberC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: const Text(
          "Contacts List",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Serachbox(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RequestandDecline(),
                ),
              );
            },
            icon: const Icon(Icons.add_box_outlined),
            iconSize: 30,
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Container(

                color: Colors.black87,
                child: Dialog(
                  alignment: Alignment.center,
                  shadowColor: Colors.blueGrey,
                  backgroundColor: Colors.grey,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 15),
                              child: IconButton(
                                iconSize: 40,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.cancel_outlined),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 15),
                              child: Center(
                                child: Text(
                                  "Save contact",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25, top: 12),
                              child: IconButton(
                                iconSize: 40,
                                onPressed: () async {
                                  if (nameC.text.isEmpty &&
                                      numberC.text.isEmpty) {
                                    const ScaffoldMessenger(
                                      child: SnackBar(
                                        content:
                                            Text("Enter the required field"),
                                      ),
                                    );
                                  } else {
                                    await FirebaseFirestore.instance
                                        .collection("Contacts")
                                        .doc()
                                        .set({
                                      "Name": nameC.text,
                                      "Number": numberC.text,
                                      "request": "pending",
                                    }, SetOptions(merge: true)).then((value) {
                                      Navigator.push;
                                      print(nameC.text);
                                      print(numberC.text);

                                      setState(() {
                                        nameC.clear();
                                        numberC.clear();
                                        Navigator.pop(context);
                                      });
                                    });
                                  }
                                },
                                icon: const Icon(Icons.check),
                              ),
                            ),
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: IconButton(
                          iconSize: 30,
                          color: Colors.grey,
                          icon: const Icon(Icons.person),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextField(
                          controller: nameC,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.grey[400],
                            hintText: "enter name",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          controller: numberC,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.grey[400],
                            hintText: "enter number",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      // body: List.isEmpty
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : Padding(
      //         padding: const EdgeInsets.only(top: 10),
      //         child: ListView.builder(
      //           itemCount: List.length,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.symmetric(
      //                   horizontal: 7, vertical: 5),
      //               child: ListTile(
      //                 shape: const ContinuousRectangleBorder(),
      //                 tileColor: Colors.white30,
      //                 textColor: Colors.white,
      //                 contentPadding:
      //                     const EdgeInsets.symmetric(horizontal: 10),
      //                 leading: const Padding(
      //                   padding: EdgeInsets.only(left: 15),
      //                   child: CircleAvatar(
      //                     radius: 20,
      //                     backgroundColor: Colors.white,
      //                     child: Icon(Icons.person, color: Colors.grey),
      //                   ),
      //                 ),
      //                 title: Padding(
      //                   padding: const EdgeInsets.only(left: 5),
      //                   child: Text(
      //                     List[index][0],
      //                     style: const TextStyle(
      //                         fontSize: 22, fontWeight: FontWeight.w500),
      //                   ),
      //                 ),
      //                 subtitle: Padding(
      //                   padding: const EdgeInsets.only(left: 5),
      //                   child: Text(List[index][1]),
      //                 ),
      //                 trailing: const Padding(
      //                   padding: EdgeInsets.only(right: 15),
      //                   child: Icon(
      //                     Icons.phone,
      //                     size: 26,
      //                     color: Colors.white60,
      //                   ),
      //                 ),
      //                 onTap: () async {
      //                   TextEditingController editname =
      //                       TextEditingController(text: List[index][0]);
      //                   TextEditingController editnumber =
      //                       TextEditingController(text: List[index][1]);
      //                   showDialog(
      //                     context: context,
      //                     builder: (context) {
      //                       return Container(
      //                         height: 100,
      //                         width: 100,
      //                         color: Colors.black87,
      //                         child: Dialog(
      //                           shadowColor: Colors.blueGrey,
      //                           backgroundColor: Colors.grey,
      //                           shape: ContinuousRectangleBorder(
      //                               borderRadius: BorderRadius.circular(25)),
      //                           child: Column(
      //                             children: [
      //                               Row(
      //                                 children: [
      //                                   Padding(
      //                                     padding: const EdgeInsets.only(
      //                                         left: 25, top: 15),
      //                                     child: IconButton(
      //                                       iconSize: 40,
      //                                       onPressed: () {
      //                                         Navigator.pop(context);
      //                                       },
      //                                       icon: const Icon(
      //                                           Icons.cancel_outlined),
      //                                     ),
      //                                   ),
      //                                   const Padding(
      //                                     padding: EdgeInsets.only(
      //                                         left: 75, top: 15),
      //                                     child: Center(
      //                                       child: Text(
      //                                         "Contact",
      //                                         style: TextStyle(
      //                                             fontSize: 26,
      //                                             fontWeight:
      //                                                 FontWeight.bold),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                               const SizedBox(
      //                                 height: 200,
      //                               ),
      //                               Padding(
      //                                 padding: const EdgeInsets.symmetric(
      //                                   horizontal: 20,
      //                                 ),
      //                                 child: TextField(
      //                                   controller: editname,
      //                                   decoration: InputDecoration(
      //                                     enabledBorder: OutlineInputBorder(
      //                                       borderRadius:
      //                                           BorderRadius.circular(25),
      //                                     ),
      //                                     filled: true,
      //                                     fillColor: Colors.grey[400],
      //                                     hintText: "enter name",
      //                                     focusedBorder: OutlineInputBorder(
      //                                       borderRadius:
      //                                           BorderRadius.circular(25),
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                               const SizedBox(
      //                                 height: 20,
      //                               ),
      //                               Padding(
      //                                 padding: const EdgeInsets.symmetric(
      //                                   horizontal: 20,
      //                                 ),
      //                                 child: TextField(
      //                                   keyboardType: TextInputType.number,
      //                                   maxLength: 10,
      //                                   controller: editnumber,
      //                                   decoration: InputDecoration(
      //                                     enabledBorder: OutlineInputBorder(
      //                                       borderRadius:
      //                                           BorderRadius.circular(25),
      //                                     ),
      //                                     focusedBorder: OutlineInputBorder(
      //                                       borderRadius:
      //                                           BorderRadius.circular(25),
      //                                     ),
      //                                     filled: true,
      //                                     fillColor: Colors.grey[400],
      //                                     hintText: "enter number",
      //                                   ),
      //                                 ),
      //                               ),
      //                               const SizedBox(
      //                                 height: 25,
      //                               ),
      //                               Row(
      //                                 children: [
      //                                   ElevatedButton(
      //                                     onPressed: () async {
      //                                       await FirebaseFirestore.instance
      //                                           .collection("Contacts")
      //                                           .doc(List[index][2])
      //                                           .delete();
      //                                     },
      //                                     child: Text("Delete"),
      //                                   ),
      //                                   ElevatedButton(
      //                                     onPressed: () async {
      //                                       if (editname.text.isEmpty &&
      //                                           editnumber.text.isEmpty) {
      //                                         ScaffoldMessenger.of(context)
      //                                             .showSnackBar(const SnackBar(
      //                                                 content: Text(
      //                                                     "Fill All Fields")));
      //                                       } else {
      //                                         await FirebaseFirestore.instance
      //                                             .collection("Contacts")
      //                                             .doc(List[index][2])
      //                                             .update({
      //                                           "Name": editname.text,
      //                                           "Number": editnumber.text,
      //                                         }).then((value) {
      //                                           Navigator.pop(context);
      //                                           Getdata();
      //                                         });
      //                                       }
      //                                     },
      //                                     child: const Text(
      //                                       "Save Edit",
      //                                       style: TextStyle(
      //                                           fontSize: 22,
      //                                           fontWeight: FontWeight.bold),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       );
      //                     },
      //                   );
      //                 },
      //               ),
      //             );
      //           },
      //         ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Contacts")
            .where("request", isEqualTo: "approved")
            .snapshots(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  child: ListTile(
                    shape: const ContinuousRectangleBorder(),
                    tileColor: Colors.white30,
                    textColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        snapshot.data!.docs[index]["Name"],
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(snapshot.data!.docs[index]["Number"]),
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.phone,
                        size: 26,
                        color: Colors.white60,
                      ),
                    ),
                    onTap: () async {
                      TextEditingController editname = TextEditingController(
                          text: snapshot.data!.docs[index]["Name"]);
                      TextEditingController editnumber = TextEditingController(
                          text: snapshot.data!.docs[index]["Number"]);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 100,
                            width: 100,
                            color: Colors.black87,
                            child: Dialog(
                              shadowColor: Colors.blueGrey,
                              backgroundColor: Colors.grey,
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, top: 15),
                                        child: IconButton(
                                          iconSize: 40,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon:
                                              const Icon(Icons.cancel_outlined),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 75, top: 15),
                                        child: Center(
                                          child: Text(
                                            "Contact",
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 200,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: TextField(
                                      controller: editname,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey[400],
                                        hintText: "enter name",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      maxLength: 10,
                                      controller: editnumber,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey[400],
                                        hintText: "enter number",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection("Contacts")
                                                .doc(snapshot
                                                    .data!.docs[index].id)
                                                .delete();
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Delete",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (editname.text.isEmpty &&
                                              editnumber.text.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Fill All Fields")));
                                          } else {
                                            await FirebaseFirestore.instance
                                                .collection("Contacts")
                                                .doc(snapshot
                                                    .data!.docs[index].id)
                                                .update(
                                              {
                                                "Name": editname.text,
                                                "Number": editnumber.text,
                                              },
                                            ).then(
                                              (value) {
                                                Navigator.pop(context);
                                              },
                                            );
                                          }
                                        },
                                        child: const Text(
                                          "Save Edit",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
