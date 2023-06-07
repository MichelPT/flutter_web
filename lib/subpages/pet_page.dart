import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PetSubPage extends StatefulWidget {
  const PetSubPage({super.key});

  @override
  State<PetSubPage> createState() => _PetSubPageState();
}

class _PetSubPageState extends State<PetSubPage> {
  late Map<dynamic, dynamic> dataSnapshots;
  Widget? thing;
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('pet');
  final _storage = firebase_storage.FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DatabaseEvent>(
      future: _ref.once(),
      builder: (context, snapshot) {
        try {
          if (snapshot.hasData && snapshot.data != null) {
            final children = snapshot.data!.snapshot.children;
            final listItems = children.map<Widget>((child) {
              dataSnapshots = child.value as Map;
              return Container(
                width: 20.h,
                height: 20.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${dataSnapshots['name']}"),
                    Text("Age: ${dataSnapshots['age']}"),
                    Text("Species: ${dataSnapshots['species']}"),
                    Text("Type: ${dataSnapshots['type']}"),
                    Image.network(
                      dataSnapshots['image'],
                      width: 2.h,
                      height: 2.w,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          print(loadingProgress.cumulativeBytesLoaded);
                          return CircularProgressIndicator(
                              value: loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!);
                        }
                        return child;
                      },
                    )
                  ],
                ),
              );
            }).toList();
            return GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: listItems,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        } catch (e) {
          printError();
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}/*
        _ref.onValue.listen((event) {
          for (final child in event.snapshot.children) {
            dataSnapshots = child.value as Map;
            print("Name\t: ${dataSnapshots['name']}");
            print("Age\t:${dataSnapshots['age']}");
            print("Species\t:${dataSnapshots['species']}");
            print("Type\t:${dataSnapshots['type']}");
            thing = ListView(
              children: [
                Text("Name\t: ${dataSnapshots['name']}"),
                Text("Age\t:${dataSnapshots['age']}"),
                Text("Species\t:${dataSnapshots['species']}"),
                Text("Type\t:${dataSnapshots['type']}"),
              ],
            );
          }
        });
        return thing;
      },
    );
    // _ref.onValue.listen((event) {
    //   for (final child in event.snapshot.children) {
    //     dataSnapshots = child.value as Map;
    //     print("Name\t: ${dataSnapshots['name']}");
    //     print("Age\t:${dataSnapshots['age']}");
    //     print("Species\t:${dataSnapshots['species']}");
    //     print("Type\t:${dataSnapshots['type']}");
    //     thing = ListView(
    //       children: [
    //         Text("Name\t: ${dataSnapshots['name']}"),
    //         Text("Age\t:${dataSnapshots['age']}"),
    //         Text("Species\t:${dataSnapshots['species']}"),
    //         Text("Type\t:${dataSnapshots['type']}"),
    //       ],
    //     );
    //   }
    // });
    // child: Text('Retrieve data'));
    // return GridView.builder(
    //   gridDelegate:
    //       const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    //   itemBuilder: (context, index) {
    //     return FutureBuilder<DataSnapshot>(
    //       builder:
    //           (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return CircularProgressIndicator();
    //         }
    //         if (snapshot.hasError) {
    //           return Text('Error: ${snapshot.error}');
    //         }
    //         if (!snapshot.hasData || snapshot.data?.value == null) {
    //           return Text('No data available');
    //         }
    //         final Map<dynamic, dynamic> pets =
    //             snapshot.data!.value as Map<dynamic, dynamic>;
    //         final List<Widget> petWidgets = [];

    //         pets.forEach((key, value) {
    //           final String name = value['name'] ?? '';
    //           final String type = value['type'] ?? '';
    //           final int age = value['age'] ?? 0;
    //           final String species = value['species'] ?? '';

    //           final petWidget = Text(
    //               'Name: $name\nType: $type\nAge: $age\nSpecies: $species');
    //           petWidgets.add(petWidget);
    //         });

    //         return GridView.count(
    //           crossAxisCount: 3,
    //           children: petWidgets,
    //         );
    //       },
    //     );
    //   },
    // );
    // GridView.count(
    //   padding: const EdgeInsets.all(15),
    //   crossAxisCount: 3,
    //   mainAxisSpacing: 5.w,
    //   crossAxisSpacing: 5.w,
    //   shrinkWrap: true,
    //   children: [
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[100],
    //       child: const Text("Adopt this retirever"),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[200],
    //       child: const Text('Hylian breed is so awesome!'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[300],
    //       child: const Text('Please adopt this dog'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[400],
    //       child: const Text('I am poor gimme dog'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[500],
    //       child: const Text('I love dogs but I love u mor-'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[600],
    //       child: const Text('Dogs? What is that?'),
    //     ),
    //   ],
    // );
  }

  Future<DatabaseEvent> fetchData() async {
    final snapshot = await _ref.once();
    return snapshot;
  }
}
*/