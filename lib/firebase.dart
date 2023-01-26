import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;

Future<User?> register(String email,String pass, BuildContext context) async {
    try {
       UserCredential usercredential=await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass,);
          return usercredential.user;
        
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  
  }

  Future<User?> login(String email,String pass, BuildContext context) async {
    try {
       UserCredential usercredential=await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass,);
          return usercredential.user;
        
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  
  }

}

