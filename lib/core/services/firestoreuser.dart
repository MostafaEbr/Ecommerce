import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/model/usermodel.dart';

class FireStoreUser
{

CollectionReference _collectionUserReference = FirebaseFirestore.instance.collection("User");

Future<void> addUserFireStore(UserModel userModel)async
{
 return await _collectionUserReference.doc(userModel.userId).set(userModel.toJason());
}

Future<DocumentSnapshot> getCurrentData (String uid )async
{
 return await _collectionUserReference.doc(uid).get();
}

}