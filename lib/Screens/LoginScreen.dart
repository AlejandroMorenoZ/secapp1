import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../imagenes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login Screen",
            style: TextStyle(color: Colors.white,fontSize: 28),
          ),
        ),
        body: Container(
            child: Center(
                child: Container(
                    width: 300,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(sechome),
                        TextField(
                          decoration: InputDecoration.collapsed(hintText: "Email", border: UnderlineInputBorder()),
                          onChanged: (value) {
                            this.setState((){_email = value;});
                          },
                        ),
                        TextField(
                          decoration: InputDecoration.collapsed(hintText: "Password", border: UnderlineInputBorder()),
                          onChanged: (value) {
                            this.setState(() {_password=value;});
                          },
                        ),
                        RaisedButton(child: Text("Sign In"), onPressed:() {
                          FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).then((onValue){

                          }).catchError((error){
                            debugPrint("Error : "+error);
                          });
                        },)
                      ],
                    )
                )
            )
        )
    );
  }
}