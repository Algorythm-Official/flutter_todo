import 'package:cloud_firestore/cloud_firestore.dart';

create(String collName, docName, name, animal, int age) async {
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .set({'name': name, 'animal': animal, 'age': age});
  print('Data Uploaded');
}

update(String collName, docName, key, var newValue) async {
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .update({key: newValue});
  print('Data Updated');
}

delete(String collName, docName) async {
  await FirebaseFirestore.instance.collection(collName).doc(docName).delete();
  print('Data Deleted');
}
