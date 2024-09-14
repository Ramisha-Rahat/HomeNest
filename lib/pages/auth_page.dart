import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homenestshop/pages/loginpage.dart';
import 'package:homenestshop/pages/mainpage.dart';


class  MyAuthPage extends StatelessWidget {
  MyAuthPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if (snapshot.hasData){
            return MyMainPage();
          }
          else{
            return MyLoginPage();
          }

        },
      ),

    );
  }
}