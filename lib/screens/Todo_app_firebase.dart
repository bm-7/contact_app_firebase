import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "T O D O  A P P",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Column(
                  children: [
                    Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () async {
                            Navigator.pop(context);
                          }),
                      const SizedBox(width: 45),
                      const Text(
                        "ADD List",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 45),
                      IconButton(
                        onPressed: () async {
                          if (_name.text.isEmpty &&
                              _number.text.isEmpty &&
                              _number.text.isEmpty) {
                            const ScaffoldMessenger(
                              child: SnackBar(
                                content: Text("Enter the required field"),
                              ),
                            );
                          } else {
                            await FirebaseFirestore.instance
                                .collection("Todo")
                                .doc()
                                .set({
                              "Name": _name.text,
                              "Number": _number.text,
                              "Description": _description.text,
                            }, SetOptions(merge: true)).then((value) {
                              Navigator.pop(context);
                              print(_name.text);
                              print(_number.text);
                              print(_description.text);
                              setState(() {});
                            });
                          }
                        },
                        icon: const Icon(Icons.check),
                      ),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: "Name"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: "Number"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: "Description"),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Todo").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int l = snapshot.data!.docs.length;
              return ListView.builder(
                itemCount: l,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 1,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 1)
                          ]),
                      child: ListTile(
                        title: Text(
                          data["Name"],
                        ),
                        subtitle: Text(
                          data["Number"],
                        ),
                        trailing: Text(data["Description"]),
                        onTap: () async {
                          TextEditingController nameedit =
                              TextEditingController(text: data["Name"]);
                          TextEditingController numberedit =
                              TextEditingController(text: data["Number"]);
                          TextEditingController descriptionedit =
                              TextEditingController(text: data["Description"]);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Column(
                                  children: [
                                    Row(children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          }),
                                      const SizedBox(width: 85),
                                      const Text(
                                        "Edit Data",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 60),
                                      IconButton(
                                        onPressed: () async {
                                          if (_name.text.isEmpty &&
                                              _number.text.isEmpty &&
                                              _number.text.isEmpty) {
                                            const ScaffoldMessenger(
                                              child: SnackBar(
                                                content: Text(
                                                    "Enter the required field"),
                                              ),
                                            );
                                          } else {
                                            await FirebaseFirestore.instance
                                                .collection("Todo")
                                                .doc()
                                                .update(
                                              {
                                                "Name": nameedit.text,
                                                "Number": numberedit.text,
                                                "Description":
                                                    descriptionedit.text,
                                              },
                                            ).then((value) {
                                              Navigator.pop(context);
                                              print(nameedit.text);
                                              print(numberedit.text);
                                              print(descriptionedit.text);
                                              setState(() {});
                                            });
                                          }
                                        },
                                        icon: const Icon(Icons.check),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            hintText: "Name"),
                                        controller: nameedit,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: TextField(
                                        controller: numberedit,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            hintText: "Number"),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: TextField(
                                        controller: descriptionedit,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            hintText: "Description"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("No Data to show"),
              );
            }
          }),
    );
  }
}
