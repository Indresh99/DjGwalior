import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';
import 'newwww.dart';
import 'loginScreen.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {


  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();



  Future<FirebaseUser> _signIn() async{

    GoogleSignInAccount account = await googleSignIn.signIn();
    GoogleSignInAuthentication gsa =await account.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gsa.idToken,
        accessToken: gsa.accessToken
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);

    final FirebaseUser currentUser = await _auth.currentUser();
    return currentUser;

  }
  void _signOut() async{

    googleSignIn.signOut();
    print("Signout");


  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
          if (snapshot.hasData){
            FirebaseUser user = snapshot.data; // this is your user instance
            /// is because there is user already logged
            return newwww(userr: user);
          }
          /// other way there is no user logged.
          return loginScreen();
        }
    );
  }
}
