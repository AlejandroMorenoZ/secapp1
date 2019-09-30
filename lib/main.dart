import 'package:flutter/material.dart';
import 'Screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Screens/MainScreen.dart';


void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "SEC",
      theme: ThemeData(
        primaryColor: Colors.teal,),
    home: _handleWindowDisplay(),
  ));
}

Widget _handleWindowDisplay (){
  return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: Text("Loading"));
      } else {
        if(snapshot.hasData){
          return MainScreen();
        } else {
          return LoginScreen();
        }
      }
    },
  );
}