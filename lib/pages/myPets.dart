import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodo/pages/petScreen.dart';
import 'package:fluttertodo/services/crudFunctions.dart';

class MyPets extends StatefulWidget {
  const MyPets({Key? key}) : super(key: key);

  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPets'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('pets').snapshots(),
          builder: (context, petSnapshot) {
            if (petSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final petDocs = petSnapshot.data!.docs;
              return ListView.builder(
                itemCount: petDocs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      trailing: IconButton(
                          onPressed: () async {
                            delete('pets', petDocs[index].id);
                          },
                          icon: Icon(Icons.delete)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetScreen(
                                      petName: petDocs[index]['name'],
                                      petAnimal: petDocs[index]['animal'],
                                      petAge: petDocs[index]['age'],
                                    )));
                      },
                      title: Text(petDocs[index]['name']),
                      subtitle: Text(petDocs[index]['animal']),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
