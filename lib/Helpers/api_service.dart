import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

abstract class ApiService{
  static const _usersCollection = "users";

  static String? _getUID(){
    var user = FirebaseAuth.instance.currentUser;
    if(user == null){return null;}
    return user.uid;
  }

  static DocumentReference _usersDoc(String uID){
    return FirebaseFirestore.instance.collection(_usersCollection).doc(uID);
  }

static Future<bool> namesSetUp() async{
  final user = FirebaseAuth.instance.currentUser;
  if(user == null){return false;}
  final uID = user.uid;
  final res = await _usersDoc(uID).get();
  return res.exists;
}

static Future<bool> saveNames(String parent, String child) async{

  final uID = _getUID();
  if(uID == null){return false;}
  final data = <String, dynamic>{
    "child_name":child,
    "parent_name":parent,
    "stories":[]
  };
  try{
    await  _usersDoc(uID).set(data);

   return true;
  }catch(e){
    debugPrint(e.toString());
    return false;
  }
}

static Future<bool> updateNames({String? parent, String? child}) async{
  final uID = _getUID();
  if(uID == null){return false;}
  try{
    if(parent == null && child == null){return false;}
    var updates = <String, dynamic>{};
    if(child != null){
      updates.addAll({"child_name":child});
    }

    if(parent != null){
      updates.addAll({"parent_name":parent});
    }
    await _usersDoc(uID).update(updates);
    return true;
  }catch(e){
    debugPrint(e.toString());
    return false;
  }
}

static Future<bool> deleteUserData() async{
  final uID = _getUID();
  if(uID == null){return false;}
  try{
    await _usersDoc(uID).delete();
    return true;
  }catch(e){
    debugPrint(e.toString());
    return false;
  }
}


}