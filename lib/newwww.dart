import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'bookingPage.dart';
import 'loginScreen.dart';
import 'package:random_string/random_string.dart';
import 'CustomShapeClipper.dart';


class newwww extends StatefulWidget {

  FirebaseUser userr;

  newwww({Key key, @required this.userr}) : super(key: key);

  @override
  _newwwwState createState() => _newwwwState();
}

class _newwwwState extends State<newwww> {

  void _signOut() async{

    FirebaseAuth.instance.signOut();
    print("Signout");

  }

  @override
  Widget build(BuildContext context) {

    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-7543244503206151~4887805570');
    myBanner..load()..show();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text("DJ Lokesh"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_pin),
            onPressed: () {
              _signOut();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>loginScreen()), ModalRoute.withName("/home"));
            },
          ),
          IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {

            },
          ),

        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
          Container(
            height: 250,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 25.0,
                      backgroundImage: NetworkImage(widget.userr.photoUrl),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 12,
                    color: Color.fromRGBO(166, 177, 183, 0.4),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 50,
                        maxWidth: 800
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.userr.displayName, style: TextStyle(
                              color: Colors.white
                            ),),
                            Text(widget.userr.email, style: TextStyle(
                                color: Colors.white
                            ),)

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assests/drawer_dj.jpg'), fit: BoxFit.cover)
              ),
            ),
          ),
            ListTile(
              title: Text("Indresh"),
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text("Indresh"),
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text("Indresh"),
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text("Indresh"),
              leading: Icon(Icons.email),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(

        ),
        child: Stack(
          children: <Widget>[
            ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(height: 300,color: Colors.redAccent,)),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _card('assests/dj1.jpg'),
                    _card('assests/dj2.jpg'),
                    _card('assests/dj3.jpg'),
                    _card('assests/dj4.jpg'),
                    _card('assests/dj5.jpg'),
                    _card('assests/dj6.jpg'),
                    _card('assests/dj7.jpg'),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                        String alpha = randomAlphaNumeric(7);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(
                          aplha: alpha,
                          name: widget.userr.displayName,
                          window_name: "Birthday",

                        )));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                        elevation: 20,
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Card(
                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            child: Center(child: Text("Birthday", style: TextStyle(
                                fontSize: 22
                            ),)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      String alpha = randomAlphaNumeric(7);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(
                        aplha: alpha,
                        name: widget.userr.displayName,
                        window_name: "Weeding",

                      )));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                        elevation: 20,
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Card(
                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            child: Center(child: Text("Weeding", style: TextStyle(
                                fontSize: 22
                            ),)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 370),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      String alpha = randomAlphaNumeric(7);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(
                        aplha: alpha,
                        name: widget.userr.displayName,
                        window_name: "Party",

                      )));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                        elevation: 20,
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Card(

                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            child: Center(child: Text("Party", style: TextStyle(
                                fontSize: 22
                            ),)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      String alpha = randomAlphaNumeric(7);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(
                        aplha: alpha,
                        name: widget.userr.displayName,
                        window_name: "Other",

                      )));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                        elevation: 20,
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Card(
                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            child: Center(child: Text("Other", style: TextStyle(
                                fontSize: 22
                            ),)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _card(name) {
    return Container(
      height: 100,
      width: 200,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: Colors.transparent,
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(name, fit: BoxFit.fill,filterQuality: FilterQuality.high,),
          )
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }


}
MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['games', 'pubg'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "ca-app-pub-7543244503206151/1378546221",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);




class Top extends StatefulWidget {
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
      ],
    );
  }
}

