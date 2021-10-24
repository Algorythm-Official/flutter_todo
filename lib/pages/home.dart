import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodo/pages/myPets.dart';
import 'package:fluttertodo/services/crudFunctions.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.room))
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    create('pets', 'tommy', 'Tommy', 'Dog', 12);
                  },
                  child: Text('Create')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPets()));
                  },
                  child: Text('Retrieve')),
              ElevatedButton(
                  onPressed: () {
                    update('pets', 'bully', 'animal', 'Cow');
                  },
                  child: Text('Update')),
              ElevatedButton(
                  onPressed: () {
                    delete('pets', 'tommy');
                  },
                  child: Text('Delete')),
              // Container(
              //   width: double.infinity,
              //   height: 50,
              //   child: ElevatedButton(
              //       onPressed: () async {
              //         await FirebaseAuth.instance.signOut();
              //       },
              //       child: Text('Logout')),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
