import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

abstract class ApiService{
  static const _usersCollection = "users";

static Future<bool> namesSetUp() async{
  final user = FirebaseAuth.instance.currentUser;
  if(user == null){return false;}
  final uID = user.uid;
  final document = FirebaseFirestore.instance.collection(_usersCollection).doc(uID);
  final res = await document.get();
  return res.exists;
}

static Future<bool> saveNames(String parent, String child) async{
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  if(user == null){return false;}
  final uID = user.uid;
  final data = <String, dynamic>{
    "child_name":child,
    "parent_name":parent,
    "stories":[]
  };
  try{
   await  db.collection(_usersCollection).doc(uID).set(data);
   return true;
  }catch(e){
    debugPrint(e.toString());
    return false;
  }
}

static Future<bool> deleteUserData() async{
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  if(user == null){return false;}
  final uID = user.uid;
  try{
    await db.collection(_usersCollection).doc(uID).delete();
    return true;
  }catch(e){
    debugPrint(e.toString());
    return false;
  }
}


}