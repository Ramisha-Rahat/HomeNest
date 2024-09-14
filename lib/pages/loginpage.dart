import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homenestshop/pages/mainpage.dart';
import 'package:homenestshop/pages/signup.dart';

class MyLoginPage extends StatefulWidget {
const MyLoginPage({super.key});


@override
State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();

  void signin(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.brown.shade400,
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email_controller.text,
        password: password_controller.text,
      );

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyMainPage()),
      );// Remove the loading dialog after successful sign in
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Remove the loading dialog before showing the error
      showErrorMessage(context, e.message ?? 'An error occurred');
    }
  }
  void showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown.shade100,
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:Stack(
            children: [
              Container(
                 decoration: BoxDecoration(
                   image: DecorationImage(
                   image:AssetImage('assets/images/Untitled design.png'),
                   fit: BoxFit.cover,
                   ),
                 ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome To HomeNest!', style: TextStyle(fontSize: 30, color: Colors.brown, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                      controller: email_controller,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black), // Set label text color to black
                        hintText: 'Enter your Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                      controller: password_controller,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                      ),
                      )
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 150,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        // if(email_controller.text=='ramisharahat@gmail.com' && password_controller.text=='11223344'){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMainPage()));
                        //  }
                        // else{
                        //   showErrorMessage;
                        //    }
                        signin(context);
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          // Adjust corner radius as needed
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password!', style: TextStyle(fontSize: 20, color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.brown,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                            },
                            child: Text('Not a user? Sign Up!', style: TextStyle(fontSize: 20, color: Colors.white),)),
                      )),
                ],
              )

            ],
          )
    );
  }



}


