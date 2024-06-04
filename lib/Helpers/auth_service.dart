import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sleepy_bear/Values/strings.dart';


abstract class AuthService{

  static Future<String?> appleAuth() async{
    try{
      final appleProvider = AppleAuthProvider();
      await FirebaseAuth.instance.signInWithProvider(appleProvider);
      return null;
    }catch(e){
      return e.toString();
    }
  }

  static Future<String?> googleAuth()async{
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
       await FirebaseAuth.instance.signInWithCredential(credential);
      return null;
    }catch(e){
      return e.toString();
    }
  }

  static void facebookAuth(){} //TODO add later

  static Future<String?> emailSignIn(String email, String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return null;
    }catch(e){
      final String message = e.toString();
      return message;
    }
  }

  static Future<String?> emailSignUp(String email, String password) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    }on FirebaseAuthException catch(e){
      final String message = e.toString();
      return message;
    }
  }

  static Future<String?> passwordReset(String email) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null;
    }on FirebaseAuthException catch(e){
      final String message = e.toString();
      return message;
    }
  }

  static Future<String?> logout() async{
    try{
       await FirebaseAuth.instance.signOut();
       return null;
    }on FirebaseAuthException catch(e){
      final String message = e.toString();
      return message;
    }
  }

  static Future<String?> deleteUser() async{
    try{
      final user = FirebaseAuth.instance.currentUser;
      if(user == null){
        return Strings.errorOccuredTitle;
      }



      await user.delete();
      return null;

    } catch(e){
      final String msg = e.toString();
      return msg;
    }
  }


}