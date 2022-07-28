import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googlesignin/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(const MyApp());
  runApp(const MyAp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sign in and list view'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data!.photoURL.toString()),
                  ),
                  Text(snapshot.data!.displayName.toString()),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: ()async{
                      await _googleSignIn.signOut();
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Logout'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          return Container(
            child: Center(
              child: GestureDetector(
                onTap: ()async{
                  final newuser = await _googleSignIn.signIn();
                  final googleauth = await newuser!.authentication;
                  final creds = GoogleAuthProvider.credential(
                    accessToken: googleauth.accessToken,
                    idToken: googleauth.idToken
                  );
                  await FirebaseAuth.instance.signInWithCredential(creds);

                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  //   return Home();
                  // },),);


                  },
                child: Container(
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('login with google'),
                  ),
                ),
              ),
            ),
          );
        }),
      );
  }
}
