import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homenestshop/pages/loginpage.dart';
import 'package:homenestshop/pages/mainpage.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  TextEditingController re_password_controller=TextEditingController();

  void register() async {
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
      if (password_controller.text == re_password_controller.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email_controller.text,
          password: password_controller.text,
        );
        Navigator.pop(context); // Remove the loading dialog after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyMainPage()),
        );
      } else {
        Navigator.pop(context); // Remove the loading dialog before showing the error
        showErrorMessage("Passwords do not match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Remove the loading dialog before showing the error
      showErrorMessage(e.message ?? 'An error occurred');
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown.shade400,
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Sign Up And Be A Part!', style: TextStyle(fontSize: 30, color: Colors.brown, fontWeight: FontWeight.bold),),
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
                        hintText: 'Enter your email',
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
                      cursorColor: Colors.black,
                        controller: password_controller,
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
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                      cursorColor: Colors.black,
                        controller: re_password_controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: 'Password',
                          hintText: 'Enter your password again',
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
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMainPage()));
                        register();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          // Adjust corner radius as needed
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyLoginPage()));
                          },
                            child: Text('Already a user? Log In!', style: TextStyle(fontSize: 20, color: Colors.white),)),
                      )),
                ],
              ),
            )

          ],
        )
    );
  }
}
