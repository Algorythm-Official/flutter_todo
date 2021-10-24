import 'package:flutter/material.dart';

class PetScreen extends StatefulWidget {
  final String petName, petAnimal;
  final int petAge;
  const PetScreen(
      {Key? key,
      required this.petName,
      required this.petAnimal,
      required this.petAge})
      : super(key: key);

  @override
  _PetScreenState createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.petName),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.petName,
                style: TextStyle(fontSize: 30),
              ),
              Text(widget.petAnimal),
              Text(widget.petAge.toString())
            ],
          ),
        ),
      ),
    );
  }
}
