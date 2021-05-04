

import 'package:flutter/material.dart';
import 'package:chatApp/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/chat_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(      
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.grey[350],
          textTheme:ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        )
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged, builder:(ctx,userSnapShot){
          if(userSnapShot.hasData) return ChatScreen();//FirebaseAuth.instance.onAuthStateChanged returns a stream abouth aut , if token is avilable or not etc.
          else return AuthScreen();
      } ),
    );
  }
}

