import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';
import 'newwww.dart';



class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
  void initState() {
    setState(() {
      _signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: RaisedButton(onPressed: (){
                _signIn().then((FirebaseUser user){
                  print(user.displayName);
                  print(user.email);
                  setState(() {
                    //AsyncSnapshot<FirebaseUser> snapshot;
                    //FirebaseUser usere = snapshot.data;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => newwww(userr: user)),ModalRoute.withName("/home"));
                  });
                }).catchError((e){
                  print(e);
                });
              },
                child: Text("SignIn"),
              ),
            ),
            Center(
              child: RaisedButton(onPressed: (){
                _signOut();
              },
                child: Text("signout"),
              ),
            ),
            Center(
              child: RaisedButton(onPressed: (){
                _signOut();
              },
                child: Text("signout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
